//
//  acceptJob.swift
//  UWorkPrototype
//
//  Created by jay jay on 2023-10-19.
//

import SwiftUI

struct acceptJob: View {
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
            Text("Job Details")
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
                    jobDetailViewModel.createJobDetailModel(detail: JobDetails(jobStartDate: jobStartDate, jobEndDate: jobEndDate, jobPriceEstimation: jobPrice))
                }) {
                    Text("Accept Job")
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

struct CustomTextField<Content: View>: View {
    var placeholder: Content
    let lightGrayColor = Color.gray.opacity(0.2)
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
            }
            TextField("", text: $text)
                .foregroundColor(Color.black.opacity(0.7))
        }
        .padding()
        .background(lightGrayColor)
        .cornerRadius(5)
    }
}

struct CustomNumberField<Content: View>: View {
    var placeholder: Content
    let lightGrayColor = Color.gray.opacity(0.2)
    @Binding var value: Double
    var format: NumberFormatter
    var body: some View {
        ZStack(alignment: .leading) {
            if value == 0 {
                placeholder
            }
            TextField("", value: $value, formatter: format)
                .foregroundColor(Color.black.opacity(0.7))
        }
        .padding()
        .background(lightGrayColor)
        .cornerRadius(5)
    }
    struct CustomNumberField<Content: View>: View {
        var placeholder: Content
        @Binding var value: Double
        var formatter: NumberFormatter
        
        init(placeholder: Content, value: Binding<Double>, formatter: NumberFormatter) {
            self.placeholder = placeholder
            self._value = value
            self.formatter = formatter
        }
        
        var body: some View {
            ZStack(alignment: .leading) {
                if value == 0 {
                    placeholder
                }
                TextField("", value: $value, formatter: formatter)
                    .foregroundColor(Color.black.opacity(0.7))
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
        }
    }
}

#Preview {
    acceptJob(jobStartDate: "October", jobEndDate: "November", jobPrice: 20.0)
}
