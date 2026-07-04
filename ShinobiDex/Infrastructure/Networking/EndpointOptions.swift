//
//  EndpointOptions.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

struct EndpointOptions: Sendable {
    let page: Int
    let limit: Int
    let name: String?
    
    init(page: Int = 1, limit: Int = 20, name: String? = nil) {
        self.page = page
        self.limit = limit
        self.name = name
    }
}
