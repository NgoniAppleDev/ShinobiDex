//
//  FixtureLoader.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum FixtureLoader {
    
    static func load<T: Decodable & Sendable>(_ type: T.Type, named fileName: String) throws -> T {
        guard let url = Bundle.main.url(
            forResource: fileName, withExtension: "json"
        ) else { throw FixtureError.fileNotFound(fileName) }
        
        let data: Data
        
        do {
            data = try Data(contentsOf: url)
        } catch {
            throw FixtureError.failedToLoadData(error)
        }
        
        do {
            return try JSONCoder.decoder.decode(T.self, from: data)
        } catch {
            DecoderDiagnostics.log(error, whileDecoding: fileName)
            throw FixtureError.decodingFailed(error)
        }
    }
}
