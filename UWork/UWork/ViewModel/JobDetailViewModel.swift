//
//  JobDetailViewModel.swift
//  UWork
//
//  Created by jay jay on 2023-11-13.
//

import Foundation
import Combine

final class JobDetailViewModel: ObservableObject{
    
    @Published var detailsRepo = JobDetailsRepository.shared
    @Published var JobArray = [JobDetails]()
    @Published var tobeUpdatedJobDetail = JobDetails()
    private var cancellables: Set<AnyCancellable> = []
    
    init(){
        self.detailsRepo.$list
            .assign(to: \.JobArray, on: self)
            .store(in: &cancellables)
        
        for detail in self.JobArray {
            print("Start Date: \(detail.jobStartDate), End Date: \(detail.jobEndDate), Cost: \(detail.jobPriceEstimation)")
        }
    }
    
    func createJobDetailModel(detail: JobDetails){
        
        detailsRepo.add(detail)
    }
    func deleteAcceptedJob(detail: JobDetails){
        detailsRepo.delete(detail)
    }
    
    func UpdateAcceptedJob(price: Double, end: String, start: String){
        
        let updatedJob = JobDetails(jobStartDate: start, jobEndDate: end, jobPriceEstimation: price)
        
        detailsRepo.update(updatedJob)
    }
    
    func getTotalCost(jobArray: [JobDetails]) -> Double{
        var totalCost: Double = 0.0
        for jobs in jobArray{
            totalCost += jobs.jobPriceEstimation
        }
        return totalCost
    }
    func setToUpdate(price: Double, end: String, start: String){
        tobeUpdatedJobDetail.jobStartDate = start
        tobeUpdatedJobDetail.jobEndDate = end
        tobeUpdatedJobDetail.jobPriceEstimation = price
    }
}
