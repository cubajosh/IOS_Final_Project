//
//  UWorkRepository.swift
//  UWork
//
//  Created by jay jay on 2023-11-14.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class UWorkRepository: ObservableObject {
    static var shared = UWorkRepository()
    
    @Published var list: [Workers] = []
    
    private let path = "worker"
    private let store = Firestore.firestore()
    
    init(){
        get()
    }
    
    func get() {
        
        store.collection(path).addSnapshotListener { snapshot, error in
            
            if let error = error {
                print(error)
                return
            }
            
            self.list = snapshot?.documents.compactMap{
                try? $0.data(as: Workers.self)
                
            } ?? []
        }
    }
    
    func add(_ worker: Workers){
        
        do {
            _ = try store.collection(path).addDocument(from: worker)
        }
        catch {
            fatalError("Adding a Worker Failed")
        }
    }
    
    func update(_ worker: Workers){
        if let documentId = worker.id{
            store.collection(path).document(documentId).setData(["firstName": worker.firstName, "lastName": worker.lastName, "emailAddress": worker.emailAddress, "hourlyRate": worker.hourlyRate, "rating": worker.rating, "trade": worker.trade, "phoneNumber": worker.phoneNumber, "password": worker.password], merge: true)
        }
    }
    
    func delete(_ worker: Workers){
        if let documentId = worker.id {
            store.collection(path).document(documentId).delete {
                error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
