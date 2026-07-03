//
//  CharacterServicing.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

protocol CharacterServicing {
    func fetchCharacters() async throws -> [ShinobiCharacter]
}
