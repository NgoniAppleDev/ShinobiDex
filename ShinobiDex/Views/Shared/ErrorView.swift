//
//  ErrorView.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct ErrorView: View {
    let presentation: ErrorPresentation
    let retry: () async -> Void
    
    var body: some View {
        ContentUnavailableView {
            Label(presentation.title, systemImage: presentation.systemImage)
        } description: {
            Text(presentation.message)
        } actions: {
            Button {
                Task {
                    await retry()
                }
            } label: {
                Label("Retry", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.glassProminent)
            .accessibilityLabel("Retry")
        }
    }
}
