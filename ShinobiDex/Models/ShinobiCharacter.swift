//
//  ShinobiCharacter.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct ShinobiCharacter: Identifiable, Codable {
    let id: Int
    let name: String
    let images: [String]
    let debut: [Debut]
    let family: [Family]
    let jutsu: [String]
    let natureType: [String]
    let personal: [PersonalInfo]
    let rank: [Rank]
    let tools: [String]
    let voiceActors: [VoiceActor]
}


