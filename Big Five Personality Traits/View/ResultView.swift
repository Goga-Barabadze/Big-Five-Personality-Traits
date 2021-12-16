//
//  ResultView.swift.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 08.12.21.
//

import SwiftUI
import SwiftUICharts

struct ResultView: View {
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        
        List {
                
            Section("Overview") {
                
                SingleOverviewDoughnutChart(result: model.archive.first!)
                
            }
            
            Section("Openness") {
                
                // MARK: - Draw gaussian glock
                
                LineChartDemoView()
                
            }
            
            Section("Conscientiousness") {
                
            }
            
            Section("Extraversion") {
                
            }
            
            Section("Agreeableness") {
                
            }
            
            Section("Neuroticism") {
                
            }
            
        }
        .navigationTitle("Results")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: MainView()) {
                    Text("Finish")
                }
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
    }
}

struct ResultView_swift_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultView()
        }
    }
}
