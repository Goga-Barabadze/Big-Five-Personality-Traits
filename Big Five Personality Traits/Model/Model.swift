//
//  Model.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 11.12.21.
//

import Foundation

class Model: ObservableObject {
    
    static var fullInventory: [InventoryItem] {
        Parser.parseInventory(name: "full-inventory", type: "json") ?? []
    }
    
    static var shortInventory: [InventoryItem] {
        Parser.parseInventory(name: "short-inventory", type: "json") ?? []
    }
    
    @Published var archive: [Result] = []
    
    #if DEBUG
    
    init() {
        
        let answers1: [Int : AnswerOption] = [
            1: .neutral,
            2: .neutral,
            3: .neutral,
            4: .neutral,
            5: .neutral,
            6: .neutral,
            7: .neutral,
            8: .neutral,
            9: .neutral,
            10: .neutral
        ]
        
        let result1 = Result(id: UUID(), participant: "Goga", date: Date(), answers: answers1, inventory: .short)
        
        let answers2: [Int : AnswerOption] = [
            1: .neutral,
            2: .disagreeALot,
            3: .neutral,
            4: .disagreeALot,
            5: .neutral,
            6: .agreeStrongly,
            7: .neutral,
            8: .agreeStrongly,
            9: .neutral,
            10: .agreeALittle
        ]
        
        let result2 = Result(id: UUID(), participant: "Lukas", date: Date(), answers: answers2, inventory: .short)
        
        archive.append(result1)
        archive.append(result2)
        
    }
    
    #endif
    
}
