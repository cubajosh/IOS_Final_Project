//
//  MessageView.swift
//  UWorkPrototype
//
//  Created by jay jay on 2023-10-19.
//

import SwiftUI


struct MessageView: View {
    @State var typingMessage: String = ""
    var buttonPressed: Bool = false
    var body: some View {
        VStack{
            Text("Bob Dillan")
                .font(.title)
                .bold()
            
            NavigationLink {
                acceptJob(jobStartDate: "", jobEndDate: "", jobPrice: 0.0)
            } label: {
                Text("Accept Job")
            }
            Button(action: {}) {
                Text("Deny Job")
            }
            VStack {
                List {
                    ChatBubble(contentMessage: "This is a message", isCurrentUser: true)
                    ChatBubble(contentMessage: "This is another message", isCurrentUser: false)
                    
                }
                HStack {
                    TextField("Message...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                    Button(action: {}) {
                        Text("Send")
                    }
                }.frame(minHeight: CGFloat(50)).padding()
            }
        }
    }
}

#Preview {
    MessageView()
}
