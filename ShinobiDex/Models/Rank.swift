//
//  Rank.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct Rank: Identifiable, Codable {
    var id: UUID = UUID()
    let ninjaRank: NinjaRank
    let ninjaRegistration: String
    
    struct NinjaRank: Identifiable, Codable {
        var id: UUID = UUID()
        let partOne: String
        let Gaiden: String
        
        enum CodingKeys: String, CodingKey {
            case partOne = "Part I"
            case Gaiden
        }
    }
}
