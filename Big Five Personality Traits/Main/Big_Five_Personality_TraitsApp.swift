//
//  Big_Five_Personality_TraitsApp.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 07.12.21.
//

import SwiftUI

@main
struct Big_Five_Personality_TraitsApp: App {
    
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(model)
        }
    }
}
