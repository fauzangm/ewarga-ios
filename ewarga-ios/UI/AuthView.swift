//
//  AuthView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 13/02/24.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        ZStack{
            Image("ilust_bg_auth")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
             
            
            VStack(spacing : 20){
                Spacer()
                Button(action: {
                    // Action untuk tombol login
                }) {
                    Text("Login")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10) // Radius tombol
                }
                .padding(.bottom)
                
                
                Button(action: {
                    // Action untuk tombol register
                }) {
                    Text("Register")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10) // Radius tombol
                }
                Spacer()
            }
            .padding()
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
