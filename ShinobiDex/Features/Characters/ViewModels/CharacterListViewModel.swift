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
    
    private var searchTask: Task<Void, Never>?
    var searchText = "" {
        didSet {
            guard searchText != oldValue else {
                return
            }
            
            scheduleSearch()
        }
    }
    
    private var searchOptions: EndpointOptions {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmed.isEmpty else { return .init() }
        return .init(name: trimmed)
    }
    
    init(repository: CharacterRepository) {
        self.repository = repository
    }
    
    private func fetchCharacters(options: EndpointOptions = .init()) async {
        
        state = .loading
        
        do {
            let characters = try await repository.fetchCharacters(options: options)
            state = .loaded(characters)
        } catch {
            state = .failed(error)
        }
    }
    
    private func scheduleSearch() {
        searchTask?.cancel()
        
        searchTask = Task {
            
            do {
                try await Task.sleep(for: .milliseconds(300))
            } catch {
                if error is CancellationError { return }
            }
            
            await fetchCharacters(options: searchOptions)
        }
    }
    
    func load() async {
        guard state.isIdle else { return }

        await fetchCharacters(options: searchOptions)
    }
    
    func retry() async {
        await fetchCharacters(options: searchOptions)
    }
}
