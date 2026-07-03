//
//  ShinobiCharacter.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation


struct ShinobiCharacter: Identifiable, Decodable, Sendable {
    let id: Int
    let name: String
    @OneOrMany var images: [String] = []
    let debut: Debut?
    let family: Family?
    @OneOrMany var jutsu: [String] = []
    @OneOrMany var natureType: [String] = []
    let personal: PersonalInfo
    let rank: Rank?
    @OneOrMany var tools: [String] = []
    let voiceActors: VoiceActor
}


