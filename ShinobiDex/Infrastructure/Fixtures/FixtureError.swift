//
//  FixtureError.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum FixtureError: LocalizedError {
    case fileNotFound(String)
    case failedToLoadData(Error)
    case decodingFailed(Error)
}

extension FixtureError {
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let file):
            return "Fixture '\(file) could not be found."
        case .failedToLoadData(let error):
            return "Failed to load fixture data: \(error.localizedDescription)"
        case .decodingFailed(let error):
            return "Failed to decode fixture: \(error.localizedDescription)"
        }
    }
}
