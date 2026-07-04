//
//  CharacterListViewModel.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

@MainActor
@Observable
final class CharacterListViewModel {
    
    private let repository: CharacterRepository
    private(set) var state: LoadState<[ShinobiCharacter]> = .idle
    
    init(repository: CharacterRepository) {
        self.repository = repository
    }
    
    func loadCharacters() async {
        
        state = .loading
        
        do {
            let characters = try await repository.fetchCharacters()
            state = .loaded(characters)
        } catch {
            state = .failed(error)
        }
    }
}
