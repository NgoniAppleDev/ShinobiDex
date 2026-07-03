//
//  APIError.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingFailed(Error)
    case network(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .invalidStatusCode(let code):
            return "The server returned status code \(code)."
        case .decodingFailed(let error):
            return "Failed to decode the response. \(error.localizedDescription)"
        case .network(let error):
            return error.localizedDescription
        }
    }
}
