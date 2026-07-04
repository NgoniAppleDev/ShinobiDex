//
//  JSONCoder.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum JSONCoder {
    
    static let decoder: JSONDecoder = {
       let decoder = JSONDecoder()
        
        // any configurations here...
        
        return decoder
    }()
    
    static let encoder: JSONEncoder = {
       let encoder = JSONEncoder()
        
        // any configurations here...
        
        return encoder
    }()
}
