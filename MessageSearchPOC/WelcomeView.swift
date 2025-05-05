//
//  WelcomeView.swift
//  MessageSearchPOC
//
//  Created by Eric Rolf on 5/4/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        HStack {
                            Text("I'm Jeanie, how can I help you?")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .background(
                                    Circle()
                                        .fill(Color.gray)
                                        .overlay(
                                            Image(systemName: "message.fill")
                                                .foregroundColor(.white)
                                                .font(.system(size: 36))
                                        )
                                )
                                .frame(width: 60, height: 60)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 16)

    }
}

#Preview {
    WelcomeView().background(Color.black)
        
}
