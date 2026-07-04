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
                content(value)
            case .failed(let error):
                ErrorView(presentation: .from(error)) {
                    await retry()
                }
            }
        }
    }
}
