//
//  SearchView.swift
//  MessageSearchPOC
//
//  Created by Eric Rolf on 5/4/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            TextField("", text: $searchText)
                .placeholder("Search...", show: searchText.isEmpty, color: .white)
                .padding()
                .background(Color.black.opacity(0.2))
                .clipShape(Capsule())
                .foregroundColor(.white)
                .font(.system(size: 18))
            
            Circle()
                .fill(Color.black.opacity(0.4))
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                )
                .frame(width: 50, height: 50)
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }
        
}

#Preview {
    SearchView()
}
