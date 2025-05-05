//
//  RecentChatView.swift
//  MessageSearchPOC
//
//  Created by Eric Rolf on 5/4/25.
//

import SwiftUI

struct RecentChatView: View {
    let recentChats = ["Check my account balance and credit score.","Show me my recent pending transactions for costco.", "What are the current loan rates?"]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("Recent Chats")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text("Show All")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            VStack(spacing: 16) {
                ForEach(recentChats, id: \.self) { chat in
                    HStack {
                        Image(systemName: "message.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(.leading)
                        Text(chat)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                        Spacer()
                    }.background(Color.black.opacity(0.2))
                        .clipShape(Capsule())
                        .padding(.horizontal)
                        
                            
                }
            }
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    RecentChatView()
        .background(Color.blue)
}
