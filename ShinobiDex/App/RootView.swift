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
                    await viewModel.retry()
                }) { characters in
                    List(characters) { character in
                        NavigationLink(value: character) {
                            CharacterRow(character: character)
                        }
                    }
                }
                .task {
                    await viewModel.load()
                }
                .searchable(
                    text: $viewModel.searchText,
                    prompt: "Search Shinobi"
                )
                .navigationTitle("Shinobi")
                .navigationDestination(for: ShinobiCharacter.self) { character in
                    CharacterDetailView(character: character)
                }
        }
    }
}

#Preview {
    RootView()
}
