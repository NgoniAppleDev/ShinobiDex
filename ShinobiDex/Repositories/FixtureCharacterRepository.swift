//
//  FixtureCharacterRepository.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

final class FixtureCharacterRepository: CharacterRepository {
    
    func fetchCharacters() async throws -> [ShinobiCharacter] {
        let characterResponse = try FixtureLoader.load(
            CharacterResponse.self,
            named: "CharactersPage1"
        )
        
        return characterResponse.characters
    }
}
