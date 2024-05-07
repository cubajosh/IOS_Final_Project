//
//  UpdateAcceptedJobSheet.swift
//  UWork
//
//  Created by jay jay on 2023-11-14.
//

import SwiftUI

struct UpdateAcceptedJobSheet: View {
    
    @State var jobStartDate: String
    @State var jobEndDate: String
    @State var jobPrice: Double
    @StateObject var jobDetailViewModel = JobDetailViewModel()
    @State var buttonPressed: Bool = false

    // Define the color palette
    let mainGreenColor = Color.green
    let lightGrayColor = Color.gray.opacity(0.2)
    let backgroundColor = Color.white

    static var currencyFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale.current
            return formatter
        }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Update Job")
                .font(.title)
                .bold()
                .foregroundColor(mainGreenColor)

            VStack(alignment: .leading, spacing: 15) {
                CustomTextField(placeholder: Text("Job Start Date").foregroundColor(mainGreenColor), text: $jobStartDate)
                CustomTextField(placeholder: Text("Job End Date").foregroundColor(mainGreenColor), text: $jobEndDate)
                CustomNumberField(
                                placeholder: Text("Job Price Estimate").foregroundColor(mainGreenColor),
                                value: $jobPrice,
                                format: Self.currencyFormatter
                            )

                Button(action: {                    
                    jobDetailViewModel.UpdateAcceptedJob(price: jobPrice, end: jobEndDate, start: jobStartDate)
                    
                    jobPrice = 0.0
                    jobStartDate = ""
                    jobEndDate = ""
                }) {
                    Text("Update Job")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(mainGreenColor)
                .foregroundColor(backgroundColor)
                .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.top, 20)
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    UpdateAcceptedJobSheet(jobStartDate: "October", jobEndDate: "November", jobPrice: 20.0)
}
