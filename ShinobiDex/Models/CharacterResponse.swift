//
//  CharacterResponse.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct CharacterResponse: Decodable, Sendable {
    let characters: [ShinobiCharacter]
    let currentPage: Int
    let pageSize: Int
    let total: Int
}
