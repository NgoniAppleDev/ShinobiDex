//
//  Debut.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

struct Debut: Identifiable, Codable {
    var id: UUID = UUID()
    let manga: String
    let anime: String
    let novel: String
    let movie: String
    let game: String
    let ova: String
    let appearsIn: String
}
