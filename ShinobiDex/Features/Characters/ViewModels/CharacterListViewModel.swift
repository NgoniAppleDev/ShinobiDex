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
    private(set) var state: CharacterListState = .idle
    
    var characters: [ShinobiCharacter] {
        guard case .loaded(let characters) = state else {
            return []
        }

        return characters
    }
    
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        
        return false
    }
    
    var isIdle: Bool {
        if case .idle = state {
            return true
        }
        
        return false
    }
    
    var error: Error? {
        guard case .failed(let error) = state else {
            return nil
        }

        return error
    }
    
    var errorMessage: String? {
        guard case .failed(let error) = state else {
            return nil
        }

        return error.localizedDescription
    }
    
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
