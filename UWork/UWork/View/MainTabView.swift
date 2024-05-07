//
//  MainTabView.swift
//  UWork
//
//  Created by jay jay on 2023-11-14.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var jobViewModel = JobDetailViewModel()
    
    var body: some View {
        Text("UWork")
            .font(.title)
            .bold()
        NavigationView{
                TabView{
                    WorkerListView(trades: viewModel.createTradeList())
                        .tabItem {
                            Text("Find Jobs")
                        }
                    MessageView()
                        .tabItem {
                            Text("Messages")
                        }
                    IncomingJobsView(jobs: jobViewModel.JobArray)
                        .tabItem {
                            Text("Incoming Jobs")
                        }
                    AcceptedJobs()
                        .tabItem{
                            Text("Accepted Jobs")
                        }
                }
                    }
    }
}

#Preview {
    MainTabView()
}
