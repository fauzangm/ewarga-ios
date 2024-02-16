//
//  FormBroadcastView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import SwiftUI

struct FormBroadcastView: View {
    @Binding var isFormBroadcast: Bool
    @State private var judul = ""
    @State private var deskripsi = ""
    @State private var coverGambar = ""
    @State private var selectedFileName = "Pilih Cover Gambar"
    @State private var selectedFile: URL? = nil
    @State private var showPicker = false
    private var errorService = ServiceError()
    
    public init(isFormBroadcast: Binding<Bool>) {
          self._isFormBroadcast = isFormBroadcast
      }
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Button(action: {
                        isFormBroadcast.toggle()
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
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                                    .foregroundColor(.black)
                                    .padding(4)
                            )
                            .frame(width: 44, height: 44) // Adjust size as needed
                    }
                    
                    Text("Buat Broadcast")
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                ScrollView{
                    
                    VStack(alignment: .leading){
                        
                        Section{
                            Text("Judul")
                                .padding(.top)
                            TextField("", text: $judul)
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                        }
                        .padding(.horizontal)
                        
                        Section{
                            Text("Cover Gambar")
                                .padding(.top)
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(maxHeight: 50)
                                HStack{
                                    Text(selectedFileName)
                                        .onTapGesture {
                                            showPicker.toggle()
                                        }
                                    Spacer()
                                    if selectedFile != nil {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.black)
                                            .padding(4)
                                    }
                                }
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        Section{
                            Text("Deskripsi")
                                .padding(.top)
                            TextField("", text: $deskripsi)
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
                                .frame(height: 100)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                        }
                        .padding(.horizontal)
                        
                        Section{
                            Text("Lampiran")
                                .padding(.top)
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(maxHeight: 50)
                                HStack{
                                    Text("Tambahkan Lampiran")
                                    Spacer()
                                    if let selectedFile = selectedFile {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.black)
                                            .padding(4)
                                    }
                                }
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    
                    
                }
                
                HStack{
                    Button(action: {
                        // Action untuk tombol login
                        
                    }) {
                        Text("Lihat")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black, lineWidth: 1) // Mengatur outline hitam dengan ketebalan 1
                            )
                            .foregroundColor(Color("primaryColor"))
                            .cornerRadius(16) // Radius tombol
                    }
                    
                    Button(action: {
                        // Action untuk tombol login
                        
                    }) {
                        Text("Simpan")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("primaryColor"))
                            .foregroundColor(.white)
                            .cornerRadius(16) // Radius tombol
                    }
                }
                .padding()
                
                
            }
            .padding()
            .fileImporter(
                isPresented: $showPicker,
                allowedContentTypes: [.pdf, .png, .jpeg],
                allowsMultipleSelection: false,
                onCompletion: { result in
                    do {
                        let fileURL = try result.get()

                        let doc = fileURL.first
                        if doc == nil {
                            throw AppError.applicationError(500, "File tidak ditemukan")
                        }

                        selectedFile = doc
                        selectedFileName = doc?.lastPathComponent ?? "Pilih Cover Gambar"

                    } catch {
                        errorService.raiseError(error: error)
                    }
                }
            )
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    FormBroadcastView(isFormBroadcast: true)
//}
