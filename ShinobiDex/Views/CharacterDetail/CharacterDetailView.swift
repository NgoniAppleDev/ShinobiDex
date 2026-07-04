//
//  CharacterDetailView.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: ShinobiCharacter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                RemoteImage(
                    url: character.primaryImageURL,
                    style: .hero
                )
                
                VStack(spacing: 12) {
                    Text(character.displayName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text(character.affiliationDisplayText)
                        .font(.headline)
                    
                    Text(character.natureDisplayText)
                        .font(.headline)
                }
                
                DetailSection(title: "🍃 Affiliation") {
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 120))
                    ], alignment: .leading) {
                        ForEach(character.personal.affiliation, id: \.self) {
                            TagView(text: $0)
                        }
                    }
                }
                
                DetailSection(title: "🌪 Nature Types") {
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 120))
                        ], alignment: .leading) {
                            ForEach(character.natureType, id: \.self) {
                                TagView(text: $0)
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CharacterDetailView(character: .preview)
}
