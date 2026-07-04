//
//  LoadableView.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct LoadableView<Value, Content: View>: View {
    
    let state: LoadState<Value>
    let loadingMessage: String?
    let retry: () async -> Void
    
    @ViewBuilder
    let content: (Value) -> Content
    
    var body: some View {
        Group {
            switch state {
            case .idle:
                ContentUnavailableView("No Content", systemImage: "tray")
            case .loading:
                LoadingView(message: loadingMessage ?? "Loading...")
            case .loaded(let value):
                if let value = value as? [Value], value.isEmpty {
                    ContentUnavailableView {
                        Label("No Content", systemImage: "figure.martial.arts.circle")
                    } description: {
                        Text("Character(s) not found.")
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
                } else {
                    content(value)
                }
            case .failed(let error):
                ErrorView(presentation: .from(error)) {
                    await retry()
                }
            }
        }
    }
}
