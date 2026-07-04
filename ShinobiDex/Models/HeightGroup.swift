//
//  HeightGroup.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct HeightGroup: Codable, Hashable, Sendable {
    let partOne: String?
    let partTwo: String?
    let blankPeriod: String?
    
    enum CodingKeys: String, CodingKey {
        case partOne = "Part I"
        case partTwo = "Part II"
        case blankPeriod = "Blank Period"
    }
}
