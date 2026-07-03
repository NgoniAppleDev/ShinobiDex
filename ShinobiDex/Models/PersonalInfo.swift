//
//  PersonalInfo.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct PersonalInfo: Identifiable, Codable, Sendable {
    var id: UUID = UUID()
    let birthdate: String
    let sex: String
    let age: [AgeGroup]
    let height: [HeightGroup]
    let weight: [WeightGroup]
    let bloodType: String
    let kekkeiGenkai: [String]
    let classification: [String]
    let tailedBeast: String
    let occupation: [String]
    let affiliation: [String]
    let team: [String]
    let clan: String
    let titles: [String]
}
