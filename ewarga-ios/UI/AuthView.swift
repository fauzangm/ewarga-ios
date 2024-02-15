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
                Text("Selamat Datang di eWarga, Digitalisasi pengelolaan informasi wilayah menggunakan teknologi terbaru!")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,32)
                    .lineSpacing(6)
                
                
                VStack {
                    Button(action: {
                        // Action untuk tombol login
                    }) {
                        Text("MASUK DENGAN GOOGLE")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("primaryColor"))
                            .foregroundColor(.white)
                            .cornerRadius(16) // Radius tombol
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Rectangle()
                              .frame(height: 1)
                              .foregroundColor(.white)
                          
                          Text("ATAU")
                              .foregroundColor(.white)
                          
                          Rectangle()
                              .frame(height: 1)
                              .foregroundColor(.white)
                    }
                    .padding(.vertical, 8)
                    
                    Button(action: {
                        // Action untuk tombol register
                    }) {
                        Text("DAFTAR DENGAN GOOGLE")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(Color("primaryColor"))
                            .cornerRadius(16) // Radius tombol
                    }
                }

             
                
            
                (
                    Text("Dengan melanjutkan, berarti Anda menyetujui ")
                        .foregroundColor(.white)
                    + Text("Persyaratan Layanan")
                        .underline(true, color: Color("primaryColor"))
                        .foregroundColor(Color("primaryColor"))
                    + Text(" dan menyatakan bahwa Anda telah membaca ")
                        .foregroundColor(.white)
                    + Text("Kebijakan Privasi")
                        .underline(true, color: Color("primaryColor"))
                        .foregroundColor(Color("primaryColor"))
                    + Text("Kami.")
                        .foregroundColor(.white)
                )
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                

                Spacer()
            }
            .padding(32)
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
