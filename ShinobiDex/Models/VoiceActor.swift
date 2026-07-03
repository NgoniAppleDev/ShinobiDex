//
//  VoiceActor.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct VoiceActor: Identifiable, Codable, Sendable {
    var id: UUID = UUID()
    let japanese: [String]
    let english: [String]
}
