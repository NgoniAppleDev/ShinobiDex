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
    
    var searchText = ""
    
    init(repository: CharacterRepository) {
        self.repository = repository
    }
    
    func loadCharacters(options: EndpointOptions = .init()) async {
        
        state = .loading
        
        do {
            let characters = try await repository.fetchCharacters(options: options)
            state = .loaded(characters)
        } catch {
            state = .failed(error)
        }
    }
}
