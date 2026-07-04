//
//  NetworkServicing.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

protocol NetworkServicing: Sendable {
    
    func fetch<T: Decodable & Sendable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T
}
