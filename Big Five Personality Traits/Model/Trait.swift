//
//  Trait.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 15.12.21.
//

import Foundation
import SwiftUI

enum Trait: Character, CaseIterable {
    
    case openness           = "O"
    case conscientiousness  = "C"
    case extraversion       = "E"
    case agreeableness      = "A"
    case neuroticism        = "N"
    
    func color() -> Color {
        
        let dic: [Character: Color] =
        [
            "O": .blue,
            "C": .cyan,
            "E": .yellow,
            "A": .red,
            "N": .black
        ]
        
        return dic[self.rawValue] ?? .blue
    }
}
