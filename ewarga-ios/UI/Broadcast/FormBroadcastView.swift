//
//  FormBroadcastView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import SwiftUI
import Apollo
import EwargaGrapqlApi
struct FormBroadcastView: View {
    @Binding var isFormBroadcast: Bool
    @State private var judul = ""
    @State private var deskripsi = ""
    @State private var coverGambar = ""
    @State private var selectedFileName = "Pilih Cover Gambar"
    @State private var selectedFile: URL? = nil
    @State private var fileName: String? = nil
    @State private var showPicker = false
    
    //Network
    //    @ObservedObject private var viewModel : CreateBroadcastsMutation? = nil
    //    @State private var isLoading = false
    //    @State private var isProcessing = false
    private var errorService = ServiceError()
    @ObservedObject private var viewModel = BroadcastViewModel()
    
    public init(isFormBroadcast: Binding<Bool>) {
        self._isFormBroadcast = isFormBroadcast
    }
    
    //    private func doSubmit() async {
    //        guard !isLoading && !isProcessing else {
    //            return
    //        }
    //
    //        isProcessing = true
    //        defer {
    //            isProcessing = false
    //        }
    //
    //        do {
    //            guard let doc = selectedFile else {
    //                print("cek file tidak valid")
    //                throw AppError.applicationError(500, "File tidak valid")
    //            }
    //            defer {
    //                print("cekDefer")
    //                doc.stopAccessingSecurityScopedResource()
    //            }
    //
    //            if doc.startAccessingSecurityScopedResource() {
    //                _ = try await viewModel.create(data: inputan!,fileUrl: doc,filename: selectedFileName)
    //
    //                // jika berhasil, maka auto dismiss
    //                isFormBroadcast.toggle()
    //            } else {
    //                print("cekDefer")
    //                throw AppError.applicationError(500, "File invalid")
    //            }
    //
    //        } catch {
    //            errorService.raiseError(error: error)
    //        }
    //    }
    //
    
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
                ZStack{
                    EmptyView()
                        .onReceive(viewModel.$isSuccesPost) { isSuccessPost in
                            if isSuccessPost {
                                isFormBroadcast.toggle()
                            }
                        }
//                    if viewModel.isLoading {
//                        DispatchQueue.main.async {
//                            ProgressView()
//                        }
//                    }
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
                            Spacer()
                        }
                        
                        
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
                        print("cek name file  \(selectedFileName)")
                        let statusEnum = StatusBroadcast.draft
                        let graphQLEnum = GraphQLEnum<StatusBroadcast>(rawValue: statusEnum.rawValue)
                        let uploadfile : Upload = selectedFileName
                        let fileCover: GraphQLNullable<Upload>? = fileName != nil ? .some(uploadfile) : nil
                        let inputan = CreateBroadcastsMutation(instansiId: "91", judul: judul, body: deskripsi, fileCover: fileCover ?? nil, lampiran: nil, broadCastSyarat: nil, publish: graphQLEnum )
                        Task {
                            await viewModel.createBroadcast(data: inputan, fileUrl: selectedFile, filename: fileName)
                        }
                        
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
                allowedContentTypes: [ .png, .jpeg],
                allowsMultipleSelection: false,
                onCompletion: { result in
                    do {
                        let fileURL = try result.get()
                        
                        let doc = fileURL.first
                        if doc == nil {
                            throw AppError.applicationError(500, "File tidak ditemukan")
                        }
                        fileName = doc?.lastPathComponent
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

