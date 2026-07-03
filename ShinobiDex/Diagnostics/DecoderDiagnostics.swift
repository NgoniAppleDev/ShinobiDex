//
//  DecoderDiagnostics.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum DecoderDiagnostics {
    
    static func log(_ error: Error, whileDecoding resource: String) {
        #if DEBUG
        
        guard let decodingError = error as? DecodingError else {
            print(error.localizedDescription)
            return
        }
        
        switch decodingError {
            
        case let .typeMismatch(type, context):
            print("""
            ───────────────────────────────
            ❌ JSON Decoding Error
            
            Reason:
            Type mismatch
            
            Expected:
            \(type)
            
            Path:
            \(codingPath(context.codingPath))
            
            Description:
            \(context.debugDescription)
            ───────────────────────────────
            """)
            
        case let .valueNotFound(type, context):
            print("""
            ───────────────────────────────
            ❌ JSON Decoding Error
            
            Reason:
            Value not found
            
            Expected:
            \(type)
            
            Path:
            \(codingPath(context.codingPath))
            
            Description:
            \(context.debugDescription)
            ───────────────────────────────
            """)
            
        case let .keyNotFound(key, context):
            print("""
            ───────────────────────────────
            ❌ JSON Decoding Error
            
            Reason:
            Missing key "\(key.stringValue)"
            
            Path:
            \(codingPath(context.codingPath))
            
            Description:
            \(context.debugDescription)
            ───────────────────────────────
            """)
            
        case let .dataCorrupted(context):
            print("""
            ───────────────────────────────
            ❌ JSON Decoding Error

            Reason:
            Data corrupted

            Path:
            \(codingPath(context.codingPath))

            Description:
            \(context.debugDescription)
            ───────────────────────────────
            """)
            
        @unknown default:
            print("""
            ───────────────────────────────
            ⚠️ Unknown DecodingError
            
            A newer version of Swift introduced a DecodingError case
            that this project doesn't explicitly handle yet.
            
            Error:
            \(decodingError)
            ───────────────────────────────
            """)
        }
        
        
        #endif
    }
    
    private static func codingPath(_ path: [CodingKey]) -> String {
        path
            .map { key in
                
                if let index = key.intValue {
                    return "[\(index)]"
                }
                
                return key.stringValue
            }
            .joined(separator: ".")
            .replacingOccurrences(of: ".[", with: "[")
    }
}
