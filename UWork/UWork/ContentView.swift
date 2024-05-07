//
//  ContentView.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @StateObject var jobViewModel = JobDetailViewModel()
    
    var body: some View {
        Group {
            if viewModel.isAuthenticated {
                MainTabView()
            }else{
                LoginView()
            }
        }
    }
}
#Preview {
    ContentView()
}
