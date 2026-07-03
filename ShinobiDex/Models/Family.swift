//
//  Family.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct Family: Identifiable, Codable, Sendable {
    var id: UUID = UUID()
    let father: String
    let mother: String
    let son: String
    let daughter: String
    let wife: String
    let adoptiveSon: String?
    let godfather: String
    
    enum CodingKeys: String, CodingKey {
        case father
        case mother
        case son
        case daughter
        case wife
        case adoptiveSon = "adoptive son"
        case godfather
    }
}
