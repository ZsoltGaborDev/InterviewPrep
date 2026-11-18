//
//  ProductsView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import SwiftUI

struct ProductsView: View {
    @State private var viewModel = ProductsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    ProgressView()
                case .empty:
                    ContentUnavailableView("No product", systemImage: "cart")
                case .error(let error):
                    Text(error.localizedDescription)
                case .completed:
                    List {
                        ForEach(filteredProducts) { product in
                            HStack(spacing: 12) {
                                AsyncImage(url: URL(string: product.image))
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(.rect(cornerRadius: 10))
                                VStack(alignment: .leading) {
                                    Text("\(product.category) - \(product.title)")
                                        .font(.subheadline)
                                    Text(product.description)
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                        .lineLimit(2)
                                }
                            }
                        }
                    }
                    .searchable(text: $searchText, placement: .automatic, prompt: "Search products..")
                }
            }
            .navigationTitle("Products")
            .task {
                await viewModel.fetchProducts()
            }
        }
    }
}

extension ProductsView {
    private var filteredProducts: [Product] {
        guard case .completed(let products) = viewModel.loadingState else { return [] }
        guard !searchText.isEmpty else { return products }
        
        return products.filter { product in
            product.title.localizedCaseInsensitiveContains(searchText) ||
            product.description.localizedCaseInsensitiveContains(searchText)
        }
                
    }
}

#Preview {
    ProductsView()
}
