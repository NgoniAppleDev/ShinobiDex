//
//  RemoteImage.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct RemoteImage: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(.rect(cornerRadius: 12))
            case .failure:
                placeholder
            @unknown default:
                placeholder
            }
        }
    }
    
    private var placeholder: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFit()
//            .padding(12)
            .frame(width: 80, height: 80)
            .clipShape(.rect(cornerRadius: 12))
            .foregroundStyle(.secondary)
    }
}
