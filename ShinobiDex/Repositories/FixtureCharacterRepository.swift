//
//  FixtureCharacterRepository.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

final class FixtureCharacterRepository: CharacterRepository {
    
    func fetchCharacters(options: EndpointOptions) async throws -> [ShinobiCharacter] {
        let response = try FixtureLoader.load(
            CharacterResponse.self,
            named: "CharactersPage1"
        )
        
        var filteredCharacters = response.characters
        
        if let name = options.name {
            filteredCharacters = filteredCharacters.filter { $0.name.localizedCaseInsensitiveContains(name) }
        }
        
        return filteredCharacters
    }
}
