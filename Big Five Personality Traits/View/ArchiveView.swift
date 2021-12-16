//
//  ArchiveView.swift
//  Big Five Personality Traits
//
//  Created by Goga Barabadze on 07.12.21.
//

import SwiftUI

struct ArchiveView: View {
    
    @EnvironmentObject var model: Model
    @State private var sortBy: String = "date"
    
    var body: some View {
        
        List {
            
            ForEach(model.archive) { item in
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text(item.participant)
                            .fontWeight(.semibold)
                        
                        Text(item.date, style: .date)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        
                        ForEach(Trait.allCases, id: \.self) { trait in
                            
                            Text(String(trait.rawValue))
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(5)
                                .background(trait.color())
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                }
                
            }
            .onDelete { (indexSet) in
                self.model.archive.remove(atOffsets: indexSet)
            }
            
        }
        .navigationTitle("Archive")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                sortButton
            }
        }
    }
    
    var sortButton: some View {
        
        Menu {
            
            Button {
                sortBy = "date"
            } label: {
                Text("Sort by Date")
            }
            
            Button {
                sortBy = "participant"
            } label: {
                Text("Sort by Participant")
            }

        } label: {
            Image(systemName: "arrow.up.arrow.down.circle")
        } primaryAction: {
            
        }
    }
}

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArchiveView()
        }
    }
}
