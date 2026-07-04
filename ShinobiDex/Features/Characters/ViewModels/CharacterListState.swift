//
//  CharacterListState.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

enum CharacterListState: Sendable {
    case idle
    case loading
    case loaded([ShinobiCharacter])
    case failed(Error)
}
