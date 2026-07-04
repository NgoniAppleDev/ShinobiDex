//
//  RemoteCharacterRepository.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

final class RemoteCharacterRepository: CharacterRepository {
    
    private let networkService: NetworkServicing
    
    init(networkService: NetworkServicing = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchCharacters(options: EndpointOptions) async throws -> [ShinobiCharacter] {
        let response = try await networkService.fetch(
            CharacterResponse.self,
            from: .fetchAll(.characters, options: options)
        )
        
        return response.characters
    }
}
