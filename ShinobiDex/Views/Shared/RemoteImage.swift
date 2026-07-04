//
//  RemoteImage.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

enum RemoteImageStyle {
    case thumbnail
    case hero
}

struct RemoteImage: View {
    let url: URL?
    var style: RemoteImageStyle = .thumbnail
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                content {
                    ProgressView()
                }
                
            case .success(let image):
                content {
                    image
                        .resizable()
                        .scaledToFill()
                }
                
            case .failure:
                content {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                }
                
            @unknown default:
                content {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
    
    @ViewBuilder
    private func content<Content: View>(
        @ViewBuilder _ view: () -> Content
    ) -> some View {
        
        switch style {
            
        case .thumbnail:
            view()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.quaternary, lineWidth: 1)
                }
            
        case .hero:
            view()
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.quaternary, lineWidth: 1)
                }
        }
    }
}
