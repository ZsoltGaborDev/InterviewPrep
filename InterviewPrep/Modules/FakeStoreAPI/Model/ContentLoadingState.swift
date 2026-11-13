//
//  ContentLoadingState.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

enum ContentLoadingState<T: Codable> {
    case loading
    case empty
    case error(error: Error)
    case completed(data: [T])
}
