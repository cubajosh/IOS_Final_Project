//
//  UWorkApp.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import SwiftUI
import Firebase

@main
struct UWorkApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
