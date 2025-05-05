//
//  ContentView.swift
//  MessageSearchPOC
//
//  Created by Eric Rolf on 5/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonPosition: CGPoint = CGPoint(
        x: UIScreen.main.bounds.width - 80,
        y: UIScreen.main.bounds.height - 200
    )
    @State private var showMessagingSearchView: Bool = false
    
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    ZStack {
                        Text("Accounts View")
                    }
                    .navigationTitle("Accounts")
                    .toolbarBackground(Color.azurite, for: .navigationBar)
                                       .toolbarBackground(.visible, for: .navigationBar)
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Accounts")
                }
                
                Text("Move Money View")
                    .tabItem {
                        Image(systemName: "arrow.right.arrow.left")
                        Text("Move Money")
                    }
                
                Text("Deposit View")
                    .tabItem {
                        Image(systemName: "tray.and.arrow.down")
                        Text("Deposit")
                    }
                
                Text("Plan View")
                    .tabItem {
                        Image(systemName: "chart.bar")
                        Text("Plan")
                    }
            }
            
            if showMessagingSearchView {
                MessagingSearchView()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
            
            FloatingActionButton(
                position: $buttonPosition,
                isExpanded: showMessagingSearchView
            ) {
                withAnimation {
                    showMessagingSearchView.toggle()
                }
            }
            .zIndex(2) // Ensure the button is always on top
        }
    }
}

struct FloatingActionButton: View {
    @Binding var position: CGPoint
    var isExpanded: Bool
    var action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(isExpanded ? Color.fireOpal : Color.opal)
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: isExpanded ? "xmark" : "message.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .animation(.spring(), value: isExpanded) // Animate the icon
                )
                .position(isExpanded
                          ? CGPoint(
                            x: geometry.size.width / 2,
                            y: geometry.size.height * 0.1
                          )
                          : position)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            guard !isExpanded else { return }
                            let newX = min(max(value.location.x, 40), geometry.size.width - 40)
                            let newY = min(max(value.location.y, 40), geometry.size.height - 120)
                            position = CGPoint(x: newX, y: newY)
                        }
                )
                .onTapGesture {
                    action()
                }
                .shadow(radius: 5)
                .animation(.spring(), value: isExpanded) // Animate the button position
        }
    }
}



extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    ContentView()
}
