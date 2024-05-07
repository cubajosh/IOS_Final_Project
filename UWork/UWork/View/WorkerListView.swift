//
//  WorkerListView.swift
//  UWorkPrototype
//
//  Created by jay jay on 2023-10-16.
//

import SwiftUI

struct WorkerListView: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel = ViewModel()
    var trades: [String]

    // Define the color palette
    let mainGreenColor = Color.green
    let lightGrayColor = Color.gray.opacity(0.2)
    let backgroundColor = Color.white

    var body: some View {
        NavigationStack {
            List(searchResults, id: \.self) { trade in
                NavigationLink(destination: TradeListView(workerListByTrade: viewModel.getAllWorkersByTrade(trade: trade))) {
                    Text(trade)
                        .foregroundColor(mainGreenColor)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5)
                }
            }
            .listStyle(PlainListStyle()) // Removes default list styling for custom look
            .navigationTitle("Get Work Done")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Help") {
                // Help action
            }.foregroundColor(mainGreenColor))
        }
        .searchable(text: $searchText, prompt: "Who Do You Need?")
        .accentColor(mainGreenColor)
        .background(backgroundColor.edgesIgnoringSafeArea(.all)) 
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return trades
        } else {
            // Case-insensitive search
            return trades.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


#Preview {
    WorkerListView(trades: [])
}
