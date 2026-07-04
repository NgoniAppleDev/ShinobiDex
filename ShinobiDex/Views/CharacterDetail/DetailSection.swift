//
//  DetailSection.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct DetailSection<Content: View> : View {
    
    let title: String
    
    @ViewBuilder
    let content: () -> Content
    
    var body: some View {
        DetailCard {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            content()
        }
    }
}
