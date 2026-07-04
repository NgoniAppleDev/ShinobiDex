//
//  CharacterRepository.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

protocol CharacterRepository {
    func fetchCharacters() async throws -> [ShinobiCharacter]
}
