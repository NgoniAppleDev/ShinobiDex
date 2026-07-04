//
//  LoadingView.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import SwiftUI

struct LoadingView: View {
    let message: String
    
    var body: some View {
        ProgressView(message)
    }
}
