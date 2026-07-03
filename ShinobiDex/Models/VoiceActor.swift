//
//  VoiceActor.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct VoiceActor: Decodable, Sendable {
    @OneOrMany var japanese: [String] = []
    @OneOrMany var english: [String] = []
}
