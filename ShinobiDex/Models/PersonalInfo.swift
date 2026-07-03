//
//  PersonalInfo.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct PersonalInfo: Decodable, Sendable {
    let birthdate: String?
    let sex: String?
    let age: AgeGroup?
    let height: HeightGroup?
    let weight: WeightGroup?
    let bloodType: String?
    @OneOrMany var  kekkeiGenkai: [String] = []
    @OneOrMany var classification: [String] = []
    let tailedBeast: String?
    @OneOrMany var occupation: [String] = []
    let affiliation: [String]
    @OneOrMany var team: [String] = []
    @OneOrMany var clan: [String] = []
    @OneOrMany var titles: [String] = []
}
