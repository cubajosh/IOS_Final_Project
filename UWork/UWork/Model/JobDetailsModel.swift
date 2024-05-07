//
//  JobDetailsModel.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import Foundation
import FirebaseFirestoreSwift

struct JobDetails: Identifiable, Codable{
    @DocumentID var id: String?
    var jobStartDate: String = ""
    var jobEndDate: String = ""
    var jobPriceEstimation: Double = 0.0
    
    init(){
        
    }
    init(jobStartDate: String, jobEndDate: String, jobPriceEstimation: Double){
        self.jobStartDate = jobStartDate
        self.jobPriceEstimation = jobPriceEstimation
        self.jobEndDate = jobEndDate
    }
}
