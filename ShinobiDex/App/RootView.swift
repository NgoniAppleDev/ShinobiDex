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
            Group {
                switch viewModel.state {
                case .idle:
                    ContentUnavailableView("No Characters", systemImage: "person.slash")
                case .loading:
                    ProgressView("Loading Characters...")
                case .loaded(let characters):
                    List(characters) { character in
                        Text(character.name)
                    }
                case .failed:
                    ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.triangle")
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
