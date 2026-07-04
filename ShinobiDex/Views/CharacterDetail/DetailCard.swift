//
//  DetailCard.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct DetailCard<Content: View> : View {
    
    @ViewBuilder
    let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            content()
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 24))
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(.quaternary, lineWidth: 1)
        }
    }
}
