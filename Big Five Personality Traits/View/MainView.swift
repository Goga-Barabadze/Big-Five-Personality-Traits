//
//  MainView.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 07.12.21.
//

import SwiftUI

struct MainView: View {
    
    @State private var iventoryLength: InventoryLength = .full
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer(minLength: 30)
                
                Text("Big Five Personality Traits")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                VStack {
                    Text("Big Five is a proven acclaimed test to evaluate a person's **main five personality traits**:\n")
                    
                    Spacer(minLength: 3)
                    
                    Text("**Openness**\n")
                    Text("**Conscientiousness**\n")
                    Text("**Extraversion**\n")
                    Text("**Agreeableness**\n")
                    Text("**Neuroticism**\n")
                    
                }
                .multilineTextAlignment(.leading)
                .font(.subheadline)
                .padding(16)
                
                Spacer(minLength: 60)
                
                VStack {
                    NavigationLink {
                        QuestionnaireView(inventoryLength: .full, result: Result())
                    } label: {
                        Text("Take the test")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    NavigationLink {
                        QuestionnaireView(inventoryLength: .short, result: Result())
                    } label: {
                        Text("Take the shortened test")
                    }
                    .controlSize(.large)
                    
                    NavigationLink {
                        ArchiveView()
                    } label: {
                        Text("Show archive")
                    }
                    .controlSize(.large)
                    
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                
                Spacer(minLength: 5)
                
                Text("The standard includes 44 questions, the short one 10 questions.")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            .navigationBarHidden(true)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
