//
//  QuestionnaireView.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 07.12.21.
//

import SwiftUI

struct QuestionnaireView: View {
    
    @EnvironmentObject var model: Model
    @State private var currentIndex = 0
    @State var inventoryLength: InventoryLength
    @State var result: Result
    @State private var showEnterInformation = false
    @State private var answers: [Int : AnswerOption] = [:]
    
    private var inventory: [InventoryItem] {
        inventoryLength == .full ? Model.fullInventory : Model.shortInventory
    }
    
    var body: some View {
        
        VStack {
            
            Text("Question \(currentIndex + 1) out of \(inventory.count).")
                .font(.caption2)
            
            Spacer()
            
            Text("I see myself as someone who")
            
            Spacer()
            
            Text(inventory[currentIndex].en)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
                .cornerRadius(10)
            
            Spacer()
            Spacer()
            
            VStack{
                
                // MARK: - Put the text of the buttons in an array or something similar
                
                Button("Agree strongly") {
                    clickedOnAnswer(answer: .agreeStrongly)
                }
                
                
                Button("Agree a little") {
                    clickedOnAnswer(answer: .agreeALittle)
                }
                
                Button("Neutral") {
                    clickedOnAnswer(answer: .neutral)
                }
                
                Button("Disagree a little") {
                    clickedOnAnswer(answer: .disagreeALittle)
                }
                
                Button("Disagree a lot") {
                    clickedOnAnswer(answer: .disagreeALot)
                }
                
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showEnterInformation) {
                EnterInformationView(result: result)
            }
            
            Spacer()
            
        }
        .padding()
    }
    
    private func clickedOnAnswer(answer: AnswerOption){
        
        if currentIndex == 0 {
            
            result = Result(id: UUID(), participant: "", date: Date(), answers: [:], inventory: inventoryLength)
            
        }else if currentIndex == inventory.count - 1 {
            
            showEnterInformation = true
            return
            
        }
        
        result.answers[currentIndex] = answer
        
        currentIndex += 1
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView(inventoryLength: .short, result: Result())
    }
}
