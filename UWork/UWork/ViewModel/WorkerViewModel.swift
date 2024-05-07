//
//  WorkerViewModel.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import Foundation
import Combine

final class ViewModel: ObservableObject{
    
    @Published var workerRepo = UWorkRepository.shared
    @Published var workerModel = [Workers]()
    @Published var tobeUpdatedWorker = Workers()
    
    private var cancellables: Set<AnyCancellable> = []
    @Published var isAuthenticated = false
    
    init(){
        self.workerRepo.$list
            .assign(to: \.workerModel, on: self)
            .store(in: &cancellables)
        
        for worker in self.workerModel {
            print("First Name: \(worker.firstName), Last Name: \(worker.lastName), Email Address: \(worker.emailAddress), Rating: \(worker.rating)")
        }
    }
    
    func createTradeList() -> ([String]){
        var allTrades: [String] = []
        for worker in workerModel {
            allTrades.append(worker.trade)
        }
        return allTrades
    }
    func getAllWorkersByTrade(trade: String) -> ([Workers]){
        var workersByTrade: [Workers] = []
        for worker in workerModel {
            if worker.trade == trade {
                workersByTrade.append(worker)
            }else{
                continue
            }
        }
        return workersByTrade
    }
    func checkAuthentication(email: String, password: String) -> () {
        
        for worker in workerModel {
            if(email == worker.emailAddress && password == worker.password){
                print("Is Authenticated")
            }else{
                print("Email or Password is incorrect")
            }
        }
    }
    func createAccount(worker: Workers) -> () {
        workerRepo.add(worker)
    }
}
