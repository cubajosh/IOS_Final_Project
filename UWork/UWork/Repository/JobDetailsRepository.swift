//
//  JobDetailsRepository.swift
//  UWork
//
//  Created by jay jay on 2023-11-14.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class JobDetailsRepository: ObservableObject {
    static var shared = JobDetailsRepository()
    
    @Published var list = [JobDetails]()
    
    private let path = "jobDetails"
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
                try? $0.data(as: JobDetails.self)
                
            } ?? []
        }
    }
    
    func add(_ details: JobDetails){
        
        do {
            _ = try store.collection(path).addDocument(from: details)
        }
        catch {
            fatalError("Adding a Todo Failed")
        }
    }
    
    func update(_ details: JobDetails){
        if let documentId = details.id{
            store.collection(path).document(documentId).setData(["jobEndDate": details.jobEndDate, "jobStartDate": details.jobStartDate, "jobPriceEstimation": details.jobPriceEstimation], merge: true)
            print("Inside the update function in the repo")
        }
    }
    
    func delete(_ details: JobDetails){
        if let documentId = details.id {
            store.collection(path).document(documentId).delete {
                error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
