//
//  BroadcastView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import SwiftUI

struct BroadcastView: View {
    @Binding var presentSideMenu: Bool
     
     var body: some View {
         VStack{
             HStack{
                 Button(action: {
                     presentSideMenu.toggle()
                 }) {
                     Circle()
                         .stroke(Color.gray, lineWidth: 1)
                         .overlay(
                             Circle()
                                 .foregroundColor(.white) // Background color white
                                 .frame(width: 44, height: 44) // Adjust size as needed
                                 .padding(4),
                             alignment: .center
                         )
                         .overlay(
                             Image(systemName: "line.horizontal.3")
                                 .foregroundColor(.black)
                                 .padding(4)
                         )
                         .frame(width: 44, height: 44) // Adjust size as needed
                 }
                 Spacer()
             }
             
             Spacer()
             Text("Broadcast")
             Spacer()
         }
         .padding(.horizontal, 24)
     }
}

//#Preview {
//    BroadcastView()
//}
