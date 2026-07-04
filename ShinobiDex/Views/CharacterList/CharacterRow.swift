//
//  CharacterRow.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct CharacterRow: View {
    let character: ShinobiCharacter
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            RemoteImage(url: character.primaryImageURL)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(character.displayName)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Group {
                    Text("\(character.affiliationEmoji) \(character.primaryAffiliation)")
                        
                    
                    Text("\(character.natureEmoji) \(character.primaryNatureType)")
                }
                .foregroundStyle(.secondary)
                .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

//#Preview {
//    CharacterRow()
//}
