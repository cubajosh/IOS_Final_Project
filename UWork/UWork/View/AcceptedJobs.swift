//
//  AcceptedJobs.swift
//  UWorkPrototype
//
//  Created by jay jay on 2023-10-19.
//

import SwiftUI

struct AcceptedJobs: View {
    @StateObject var jobViewModel: JobDetailViewModel = JobDetailViewModel()
    var totalPrice: Double = 0.0
    @State private var showingSheet = false
    
    let mainGreenColor = Color.green
    let lightGrayColor = Color.gray.opacity(0.2)
    let backgroundColor = Color.white
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Accepted Jobs")
                    .font(.title)
                    .bold()
                    .foregroundColor(mainGreenColor)
                    .padding(.bottom, 10)
                
                List {
                    ForEach(jobViewModel.JobArray) { job in
                        VStack(alignment: .leading) {
                            
                            Text("Start Date: \(job.jobStartDate)")
                            Text("End Date: \(job.jobEndDate)")
                            Text("Estimated Cost: $\(job.jobPriceEstimation, specifier: "%.2f")")
                            
                            Spacer()
                            HStack{
                                Button(action: {
                                    showingSheet.toggle()
                                }, label: {
                                    Image(systemName: "pencil")
                                }).sheet(isPresented: $showingSheet){
                                    UpdateAcceptedJobSheet(jobStartDate: job.jobStartDate, jobEndDate: job.jobEndDate, jobPrice: job.jobPriceEstimation)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                
                                Button(action: {
                                    jobViewModel.deleteAcceptedJob(detail: job)
                                }, label: {
                                    Image(systemName: "trash")
                                })
                            }
                        }
                        .foregroundColor(mainGreenColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(lightGrayColor))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(mainGreenColor, lineWidth: 2)
                        )
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
                
                HStack {
                    Text("Total Profits: ")
                        .bold()
                    Text("$\(jobViewModel.getTotalCost(jobArray: jobViewModel.JobArray), specifier: "%.2f")")
                }
                .font(.title2)
                .foregroundColor(mainGreenColor)
                .padding()
                .background(backgroundColor)
                .cornerRadius(8)
                .padding(.bottom, 10)
            }
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(mainGreenColor)
    }
}

#Preview {
    AcceptedJobs()
}
