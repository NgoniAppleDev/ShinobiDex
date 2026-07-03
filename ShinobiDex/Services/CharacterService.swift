//
//  CharacterService.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

final class CharacterService: CharacterServicing {
    
    private let networkService: NetworkServicing
    
    init(networkService: NetworkServicing) {
        self.networkService = networkService
    }
    
    func fetchCharacters() async throws -> [ShinobiCharacter] {
        let response = try await networkService.fetch(
            CharacterResponse.self,
            from: .characters
        )
        
        return response.characters
    }
}
