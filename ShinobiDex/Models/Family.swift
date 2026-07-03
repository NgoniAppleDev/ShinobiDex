//
//  Family.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct Family: Decodable, Sendable {
    
    let father: String?
    let mother: String?
    let grandfather: String?
    let grandmother: String?
    
    let brother: String?
    let sister: String?
    
    let son: String?
    let daughter: String?
    
    let husband: String?
    let wife: String?
    
    let adoptiveFather: String?
    let adoptiveMother: String?
    let adoptiveSon: String?
    let adoptiveDaughter: String?
    
    let godfather: String?
    let godmother: String?
    
    enum CodingKeys: String, CodingKey {
        case father
        case mother
        case grandfather
        case grandmother
        case brother
        case sister
        case son
        case daughter
        case husband
        case wife
        
        case adoptiveFather = "adoptive father"
        case adoptiveMother = "adoptive mother"
        case adoptiveSon = "adoptive son"
        case adoptiveDaughter = "adoptive daughter"
        
        case godfather
        case godmother
    }
}
