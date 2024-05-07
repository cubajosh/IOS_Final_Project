//
//  ChatBubble.swift
//  UWorkPrototype
//
//  Created by jay jay on 2023-10-19.
//

import SwiftUI

struct ChatBubble: View {
    var contentMessage: String
    var isCurrentUser: Bool
    var body: some View {
        Text(contentMessage)
                    .padding(10)
                    .foregroundColor(isCurrentUser ? Color.white : Color.black)
                    .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                    .cornerRadius(10)
            }
    }


#Preview {
    ChatBubble(contentMessage: "", isCurrentUser: true)
}
