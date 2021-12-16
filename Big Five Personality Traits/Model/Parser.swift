//
//  Parser.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 11.12.21.
//

import Foundation

struct Parser {
    
    static func parseInventory(name: String, type: String) -> [InventoryItem]? {
        
        let decoder = JSONDecoder()
        
        guard let filePath = Bundle.main.path(forResource: name, ofType: type) else {
            return nil
        }
        
        do {
            
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let inventoryItems = try decoder.decode([InventoryItem].self, from: jsonData)
            
            return inventoryItems
            
        } catch {
            print(error)
            return nil
        }
        
    }
    
}
