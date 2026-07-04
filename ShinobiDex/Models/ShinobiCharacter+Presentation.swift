//
//  ShinobiCharacter+Presentation.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

extension ShinobiCharacter {
    
    var primaryImageURL: URL? {
        images.first.flatMap { URL(string: $0) }
    }
    
    var hasImage: Bool {
        primaryImageURL != nil
    }
    
    var primaryAffiliation: String {
        self.personal.affiliation.first ?? "Unknown Affiliation"
    }
    
    var affiliationEmoji: String {
        switch primaryAffiliation {
        case let type where type.contains("Konohagakure"):
            return "🍃"
        case let type where type.contains("Sunagakure"):
            return "🏜️"
        case let type where type.contains("Kirigakure"):
            return "🌊"
        case let type where type.contains("Kumogakure"):
            return "⚡"
        case let type where type.contains("Iwagakure"):
            return "🪨"
        default:
            return "🏯"
                    
                    
                     
        }
    }
    
    var hasAffiliation: Bool {
        !personal.affiliation.isEmpty
    }
    
    var primaryNatureType: String {
        self.natureType.first ?? "Unknown Nature Type"
    }
    
    var natureEmoji: String {
        switch primaryNatureType {
        case let type where type.contains("Wind"):
            return "🌪"
        case let type where type.contains("Fire"):
            return "🔥"
        case let type where type.contains("Water"):
            return "🌊"
        case let type where type.contains("Earth"):
            return "🪨"
        case let type where type.contains("Lightning"):
            return "⚡"
        case let type where type.contains("Lava"):
            return "🌋"
        case let type where type.contains("Boil"):
            return "♨️"
        case let type where type.contains("Magnet"):
            return "🧲"
        case let type where type.contains("Yang"):
            return "☀️"
        case let type where type.contains("Yin"):
            return "🌙"
        default:
            return "🌪"
        }
    }
    
    var hasNatureType: Bool {
        !natureType.isEmpty
    }
    
    var displayName: String {
        name
    }
    
    var affiliationDisplayText: String {
        "\(affiliationEmoji) \(primaryAffiliation)"
    }
    
    var natureDisplayText: String {
        "\(natureEmoji) \(primaryNatureType)"
    }
}
