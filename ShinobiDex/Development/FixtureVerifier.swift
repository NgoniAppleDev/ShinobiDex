//
//  FixtureVerifier.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum FixtureVerifier {
    
    static func verifyCharactersFixture() throws {
        let response = try FixtureLoader.load(
            CharacterResponse.self,
            named: "CharactersPage1"
        )
        
        print("Loaded \(response.characters.count)")
        print(response.characters.first?.name ?? "No Characters.")
    }
}
