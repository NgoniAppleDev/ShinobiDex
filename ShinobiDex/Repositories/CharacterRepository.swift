//
//  CharacterRepository.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

protocol CharacterRepository: Sendable {
    func fetchCharacters(options: EndpointOptions) async throws -> [ShinobiCharacter]
}

extension CharacterRepository {
    func fetchCharacters() async throws -> [ShinobiCharacter] {
        try await fetchCharacters(options: .init())
    }
}
