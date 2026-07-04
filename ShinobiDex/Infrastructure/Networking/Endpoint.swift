//
//  Endpoint.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct Endpoint {
    let path: String
    var method: HTTPMethod = .get
    var queryItems: [URLQueryItem] = []
    var headers: [String: String] = [:]
    var body: Data? = nil
}

extension Endpoint {
    
    static let baseURL = URL(string: "https://dattebayo-api.onrender.com")!
    
    var url: URL? {
        var components = URLComponents(
            url: Self.baseURL, resolvingAgainstBaseURL: true
        )
        
        components?.path = path
        
        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }
        
        return components?.url
    }
    
    var request: URLRequest? {
        guard let url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}

extension Endpoint {
    
    /// All characters endpoint: /character
    /// - Returns: ShinobiCharacter instances
    static let characters = Endpoint(path: "/characters")
    
    /// Single ShinobiCharacter endpoint
    ///
    /// - Parameter id: ShinobiCharacter id
    /// - Returns: ShinobiCharacter Instance
    static func character(id: Int) -> Endpoint {
        .init(path: "/characters/\(id)")
    }
}
