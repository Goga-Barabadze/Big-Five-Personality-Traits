//
//  EnterInformationView.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 07.12.21.
//

import SwiftUI

struct EnterInformationView: View {
    
    @State private var name: String = ""
    @State var result: Result
    @State var genders: [String] = ["Female", "Male", "Rather not say"]
    @State var isShowingResultView: Bool = false
    
    var body: some View {
        
        Form {
            
            Section() {
                
                HStack {
                    Text("Name")
                    TextField("Enter your name", text: $name)
                        .multilineTextAlignment(.trailing)
                }
            }
            
            Section {
                
                Button("Save and show result") {
                    isShowingResultView = true
                    result.participant = name
                }
                .fullScreenCover(isPresented: $isShowingResultView){
                    ResultView()
                }

            }
            
        }
        .navigationTitle("Finishing up...")
    }
}

struct EnterInformation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EnterInformationView(result: Result())
        }
    }
}
