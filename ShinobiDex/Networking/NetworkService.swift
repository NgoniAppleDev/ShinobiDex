//
//  NetworkService.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

final class NetworkService: NetworkServicing {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T: Decodable & Sendable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T {
        
        // 1. build the request
        guard let request = endpoint.request else {
            throw APIError.invalidURL
        }
        
        // 2. execute the request
        let (data, response): (Data, URLResponse)
        
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw APIError.network(error)
        }
        
        // 3. validate the response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200 ... 299).contains(httpResponse.statusCode) else {
            throw APIError.invalidStatusCode(httpResponse.statusCode)
        }
        
        // 4. decode the response
        do {
            return try JSONCoder.decoder.decode(T.self, from: data)
        } catch {
            DecoderDiagnostics.log(error, whileDecoding: endpoint.path)
            throw APIError.decodingFailed(error)
        }
    }
}
