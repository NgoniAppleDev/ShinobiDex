//
//  Rank.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct Rank: Codable, Sendable {
    let ninjaRank: NinjaRank
    let ninjaRegistration: String?
    
    struct NinjaRank: Codable, Sendable {
        let partOne: String?
        let Gaiden: String?
        
        enum CodingKeys: String, CodingKey {
            case partOne = "Part I"
            case Gaiden
        }
    }
}
