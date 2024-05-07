//
//  TradeListView.swift
//  UWorkPrototype
//
//  Created by jay jay on 2023-10-16.
//

import SwiftUI

struct TradeListView: View {
    var workerListByTrade: [Workers]
    
    let mainGreenColor = Color.green
    let lightGrayColor = Color.gray.opacity(0.2)
    let backgroundColor = Color.white
    var body: some View{
    NavigationStack {
                List(workerListByTrade) { worker in
                    NavigationLink(destination: MessageView()) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(worker.firstName) \(worker.lastName)")
                                    .font(.headline)
                                Text("$\(worker.hourlyRate, specifier: "%.2f") per hour")
                                    .font(.subheadline)
                                Text("\(worker.rating)/5")
                                    .font(.subheadline)
                            }
                            Spacer()
                            // Add additional information or icons here if needed
                        }
                        .foregroundColor(mainGreenColor)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5)
                    }
                }
                .listStyle(PlainListStyle()) // Removes default list styling for custom look
                .navigationTitle("Available Workers")
                .navigationBarTitleDisplayMode(.inline)
                .background(backgroundColor.edgesIgnoringSafeArea(.all)) // Sets the background color
            }
            .accentColor(mainGreenColor)
        }
}

#Preview {
    TradeListView(workerListByTrade: [])
}
