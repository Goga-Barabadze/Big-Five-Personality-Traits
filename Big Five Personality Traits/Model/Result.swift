//
//  Result.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 07.12.21.
//

import Foundation
import UIKit

struct Result: Identifiable {
    
    var id = UUID()
    var participant = ""
    var date = Date()
    var answers: [Int : AnswerOption] = [:]
    var inventory: InventoryLength = .full
    
    var openness: Int           { calculateTraitScore(trait: "O") }
    var conscientiousness: Int  { calculateTraitScore(trait: "C") }
    var extraversion: Int       { calculateTraitScore(trait: "E") }
    var agreeableness: Int      { calculateTraitScore(trait: "A") }
    var neuroticism: Int        { calculateTraitScore(trait: "N") }
    
    private func calculateTraitScore(trait: String) -> Int {
        
        var result: Int = 0
        let inventory = self.inventory == .full ? Model.fullInventory : Model.shortInventory
        
        for (key, value) in answers {
            
            guard let question = inventory.first(where: {$0.id == key}) else {
                return 0
            }
            
            if question.trait == trait {
                result += question.reversed ? -value.rawValue : value.rawValue
            }
            
        }
        
        return result
    }
    
    
}
