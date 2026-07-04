//
//  OneOrMany.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

/// Decodes either a single value or an array of values,
/// always exposing an array to the rest of the application.
@propertyWrapper
struct OneOrMany<Value: Codable & Hashable & Sendable>: Decodable, Hashable, Sendable {
    
    var wrappedValue: [Value]
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        if let values = try? container.decode([Value].self) {
            self.wrappedValue = values
            return
        }
        
        if let value = try? container.decode(Value.self) {
            self.wrappedValue = [value]
            return
        }
        
        throw DecodingError.typeMismatch(
            [Value].self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Expected either a single value or an array of values."
            )
        )
    }
    
    init(wrappedValue: [Value]) {
        self.wrappedValue = wrappedValue
    }
}


extension KeyedDecodingContainer {
    
    func decode<Value>(_ type: OneOrMany<Value>.Type, forKey key: Key) throws -> OneOrMany<Value> where Value: Decodable & Sendable {
        
        try decodeIfPresent(type, forKey: key) ?? OneOrMany(wrappedValue: [])
    }
}
