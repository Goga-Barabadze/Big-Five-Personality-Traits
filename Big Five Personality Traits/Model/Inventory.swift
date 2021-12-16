//
//  Inventory.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 11.12.21.
//

import Foundation

struct InventoryItem: Decodable {
    
    var id: Int
    var reversed: Bool
    var trait: String
    var en: String
    var de: String
    
}
