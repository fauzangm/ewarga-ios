//
//  SearchBar.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import SwiftUI

struct SearchBar: View {
    var hint: String
    @Binding var text : String
    
    var body: some View {
        HStack {
            TextField(hint, text: $text)
                .padding(.leading, 30)
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding()
        }
        .padding(8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding(.horizontal, 24)
    }
}
