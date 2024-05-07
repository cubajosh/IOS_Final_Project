//
//  WorkerModel.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import Foundation
import FirebaseFirestoreSwift

struct Workers: Identifiable, Codable{
    
    @DocumentID var id: String?
    var firstName: String = ""
    var lastName: String = ""
    var hourlyRate: Double = 0.0
    var trade: String = ""
    var rating: Int = 0
    var emailAddress: String = ""
    var phoneNumber: String = ""
    var password: String = ""
    var termsAccepted: Bool = false
    
    init(){
        
    }
    init(firstName: String, lastName: String, hourlyRate: Double, trade: String, rating: Int, emailAddress: String, phoneNumber: String, password: String, termsAccepted: Bool){
        
        self.firstName = firstName
        self.lastName = lastName
        self.hourlyRate = hourlyRate
        self.trade = trade
        self.rating = rating
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.password = password
        self.termsAccepted = termsAccepted
    }
    
}
