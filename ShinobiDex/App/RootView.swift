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
                    await viewModel.loadCharacters()
                }) { characters in
                    List(characters) { character in
                        NavigationLink {
                            Text(character.displayName)
                        } label: {
                            CharacterRow(character: character)
                        }
                    }
                }
            .task {
                await viewModel.loadCharacters()
            }
            .navigationTitle("Shinobi")
        }
    }
}

#Preview {
    RootView()
}
