//
//  NetworkService.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

final class NetworkService: NetworkServicing {
    
    private let session: URLSession
    private let baseURL = URL(string: "https://dattebayo-api.onrender.com")!
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T: Decodable & Sendable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T {
        
        // 1. make request
        let request = try makeRequest(from: endpoint)
        
        // 2. execute the request
        let (data, response) = try await perform(request)
        
        // 3. validate the response
        try validate(response)
        
        // 4. decode the response
        return try decode(T.self, from: data, endpoint: endpoint)
    }
    
    private func makeRequest(from endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents(
            url: baseURL,
            resolvingAgainstBaseURL: false
        )
        
        components?.path = endpoint.path
        components?.queryItems = endpoint.queryItems
        
        guard let url = components?.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .useProtocolCachePolicy
        request.timeoutInterval = 30
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        
        for (field, value) in endpoint.headers {
            request.setValue(value, forHTTPHeaderField: field)
        }
        
        return request
    }
    
    private func perform(_ request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await session.data(for: request)
        } catch {
            throw APIError.network(error)
        }
    }
    
    private func validate(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200 ... 299).contains(httpResponse.statusCode) else {
            throw APIError.invalidStatusCode(httpResponse.statusCode)
        }
    }
    
    private func decode<T: Decodable & Sendable>(_ type: T.Type, from data: Data, endpoint: Endpoint) throws -> T {
        do {
            return try JSONCoder.decoder.decode(T.self, from: data)
        } catch {
            DecoderDiagnostics.log(error, whileDecoding: "\(endpoint)")
            throw APIError.decodingFailed(error)
        }
    }
}
