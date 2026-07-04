//
//  RootView.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import SwiftUI

struct RootView: View {
    @State private var viewModel: CharacterListViewModel = .init(
        repository: RemoteCharacterRepository()
    )
    
    var body: some View {
        NavigationStack {
            LoadableView(
                state: viewModel.state,
                loadingMessage: "Loading Characters",
                retry: {
                    await viewModel.loadCharacters(options: .init(name: "Naruto"))
                }) { characters in
                    List(characters) { character in
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            CharacterRow(character: character)
                        }
                    }
                }
                .task(id: viewModel.searchText) {
                    do {
                        try await Task.sleep(for: .milliseconds(300))
                    } catch {
                        if error is CancellationError { return }
                    }
                    
                    let searchText = viewModel.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
                    if searchText.isEmpty {
                        await viewModel.loadCharacters()
                    } else {
                        await viewModel.loadCharacters(options: .init(name: searchText))
                    }
                }
                .searchable(
                    text: $viewModel.searchText,
                    prompt: "Search Shinobi"
                )
                .navigationTitle("Shinobi")
        }
    }
}

#Preview {
    RootView()
}
