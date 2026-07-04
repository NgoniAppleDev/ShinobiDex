//
//  ShinobiCharacter+Preview.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation


extension ShinobiCharacter {
    
    static var preview: ShinobiCharacter {
        CharacterResponse.preview.characters.first!
    }
}
