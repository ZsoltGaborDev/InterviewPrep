//
//  ProductsView.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import SwiftUI

struct ProductsView: View {
    @State private var viewModel = ProductsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
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
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductsView()
}
