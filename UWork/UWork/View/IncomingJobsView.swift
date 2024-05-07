//
//  IncomingJobsView.swift
//  UWorkPrototype
//
//  Created by jay jay on 2023-10-19.
//

import SwiftUI

struct IncomingJobsView: View {
    var jobs: [JobDetails] = []
    
    let mainGreenColor = Color.green
    let lightGrayColor = Color.gray.opacity(0.2)
    let backgroundColor = Color.white
    let darkTextColor = Color.black.opacity(0.7)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(jobs) { job in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(mainGreenColor)
                            Text("\(job.jobStartDate)")
                                .foregroundColor(darkTextColor)
                        }
                        HStack {
                            Image(systemName: "calendar.badge.exclamationmark")
                                .foregroundColor(mainGreenColor)
                            Text("\(job.jobEndDate)")
                                .foregroundColor(darkTextColor)
                        }
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .foregroundColor(mainGreenColor)
                            Text("Estimated Cost: $\(job.jobPriceEstimation, specifier: "%.2f")")
                                .foregroundColor(darkTextColor)
                        }
                    }
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
            .navigationTitle("Incoming Jobs")
            .navigationBarTitleDisplayMode(.inline)
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .foregroundColor(darkTextColor)
        }
        .accentColor(mainGreenColor)
    }
}
    
    #Preview {
        IncomingJobsView(jobs: [])
    }
    
