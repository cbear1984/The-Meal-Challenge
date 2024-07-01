//
//  CustomError.swift
//  The Meal Challenge
//
//  Created by Chris Bearden on 6/27/24.
//

import Foundation

enum CustomError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid Datas"
        }
    }
}
