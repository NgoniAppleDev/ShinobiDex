//
//  Endpoint.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum Endpoint: Sendable {
    case fetchAll(
        APIResource,
        options: EndpointOptions = .init()
    )
    
    case fetchByIDs(
        APIResource,
        ids: [Int]
    )
}

extension Endpoint {
    
    var path: String {
        switch self {
        case .fetchAll(let resource, _):
            return "/\(resource.rawValue)"
            
        case .fetchByIDs(let resource, let ids):
            let joinedIDs = ids.map(String.init).joined(separator: ",")
            
            return "/\(resource.rawValue)/\(joinedIDs)"
        }
    }
}

extension Endpoint {
    
    var queryItems: [URLQueryItem] {
        switch self {
            
        case .fetchAll(_, let options):
            var items: [URLQueryItem] = [
                .init(name: "page", value: "\(options.page)"),
                .init(name: "limit", value: "\(options.limit)")
            ]
            
            if let name = options.name {
                items.append(.init(name: "name", value: name))
            }
            
            return items
        
        case .fetchByIDs:
            return []
        }
    }
}

extension Endpoint: CustomStringConvertible {
    
    var description: String {
        guard !queryItems.isEmpty else { return path }
        
        var components = URLComponents()
        components.path = path
        components.queryItems = queryItems
        
        return components.string ?? path
    }
}

extension Endpoint {
    
    var method: HTTPMethod { .get }
    
    var headers: [String: String] { [:] }
    
    var body: Data? { nil }
}
    
