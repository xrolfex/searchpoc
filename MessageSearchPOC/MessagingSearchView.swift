//
//  MessagingSearchView.swift
//  MessageSearchPOC
//
//  Created by Eric Rolf on 5/4/25.
//

import SwiftUI

struct PlaceholderStyle: ViewModifier {
    var show: Bool
    var text: String
    var color: Color

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show {
                Text(text)
                    .foregroundColor(color)
                    .padding(.leading, 8)
            }
            content
                .foregroundColor(.white)
        }
    }
}

extension View {
    func placeholder(_ text: String, show: Bool, color: Color = .gray) -> some View {
        self.modifier(PlaceholderStyle(show: show, text: text, color: color))
    }
}

struct MessagingSearchView: View {
    @State private var gradientAngle: Double = 0

    var body: some View {
        VStack {
            VStack {
                WelcomeView()
                SearchView()
                RecentSearchView()
                RecentChatView()
//                Spacer()
                Button(action: {
                    // Action for the button
                }) {
                    Text("Chat Now")
                        .foregroundColor(.blue).font(.headline) // Text color
                        .padding()
                        .frame(maxWidth: .infinity) // Full width
                        .background(Color.white) // White background
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        .clipShape(Capsule())
                        .padding(.horizontal)
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.9)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    AngularGradient(
                        gradient: Gradient(colors: [
                            Color.azurite,
                            Color.lapis,
                            Color.opal,
                            Color.azurite
                        ]),
                        center: UnitPoint(x: -0.1, y: 1.1),
                        angle: .degrees(gradientAngle)
                    )
                    .animation(.linear(duration: 60).repeatForever(autoreverses: false), value: gradientAngle)
                    
                    Color.white.opacity(0.2)
                        .blur(radius: 20)
                }
            )
            .cornerRadius(6, corners: [.topLeft, .topRight])
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: -2)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.clear, lineWidth: 0)
            )
            .padding(.top, UIScreen.main.bounds.height * 0.1)
            .onAppear {
                withAnimation {
                    gradientAngle = 360 // Rotate the gradient fully
                }
            }
        }
    }
}

#Preview {
    MessagingSearchView()
}
