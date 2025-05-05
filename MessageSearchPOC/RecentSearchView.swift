//
//  ReacentSearchView.swift
//  MessageSearchPOC
//
//  Created by Eric Rolf on 5/4/25.
//

import SwiftUI

struct RecentSearchView: View {
    let popularSearches = ["Account Balance", "Loan Options", "Credit Cards", "Mortgage Rates", "Investment Plans"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular Searches")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text("Show All")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(popularSearches, id: \.self) { search in
                        Text(search)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    RecentSearchView().background(Color.black)
}
