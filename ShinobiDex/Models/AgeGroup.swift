//
//  AgeGroup.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct AgeGroup: Codable, Sendable {
    let partOne: String?
    let partTwo: String?
    let academyGraduate: String?
    
    enum CodingKeys: String, CodingKey {
        case partOne = "Part I"
        case partTwo = "Part II"
        case academyGraduate = "Academy Graduate"
    }
}
