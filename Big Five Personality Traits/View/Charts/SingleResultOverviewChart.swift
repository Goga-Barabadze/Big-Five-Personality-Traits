//
//  SingleResultOverviewChart.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 15.12.21.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct SingleOverviewDoughnutChart: View {
    
    var data: DoughnutChartData!
    
    init(result: Result) {
        
        data = generateData(result: result)
        
    }
    
    var body: some View {
        VStack {
            DoughnutChart(chartData: data)
                .headerBox(chartData: data)
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(data.id)
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
            
        }
        .navigationTitle("Overview")
        
    }
    
    
    private func generateData(result: Result) -> DoughnutChartData {
        
        let pieChartDataPoints: [PieChartDataPoint] = [
            PieChartDataPoint(value: Double(result.openness), description: "Openness", colour: Trait.openness.color()),
            PieChartDataPoint(value: Double(result.conscientiousness), description: "Conscientiousness", colour: Trait.conscientiousness.color()),
            PieChartDataPoint(value: Double(result.extraversion), description: "Extraversion", colour: Trait.extraversion.color()),
            PieChartDataPoint(value: Double(result.agreeableness), description: "Agreeableness", colour: Trait.agreeableness.color()),
            PieChartDataPoint(value: Double(result.neuroticism), description: "Neuroticism", colour: Trait.neuroticism.color())
        ]
        
        let pieDataSet = PieDataSet(dataPoints: pieChartDataPoints, legendTitle: "Legend Title")
        
        let metadata = ChartMetadata(title: "Step Count", subtitle: "Over a Week")
        
        let chartStyle = DoughnutChartStyle(
            infoBoxPlacement: .infoBox(isStatic: false),
            infoBoxContentAlignment: .horizontal,
            globalAnimation: .easeOut(duration: 1),
            strokeWidth: CGFloat(3.0)
        )
        
        return DoughnutChartData(
            dataSets: pieDataSet,
            metadata: metadata,
            chartStyle: chartStyle,
            noDataText: Text("No data available."))
        
    }
}
