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
    @State var isLampiraBroadcast = false
    @State var isKriteriaBroadcast = false
    @State var selectedIdInstansi: [String] = []
    @State var selectedTargetJabatan: [String] = []
    @State private var judul = ""
    @State private var deskripsi = ""
    @State private var coverGambar = ""
    @State private var selectedFileName = "Pilih Cover Gambar"
    @State private var selectedFile: URL? = nil
    @State private var fileName: String? = nil
    @State private var showPicker = false
    @State private var showError = false
    @State private var lampiranURL : [ModelLampiran] = []
    @State private var inputan : CreateBroadcastsMutation? = nil
    private var errorService = ServiceError()
    @ObservedObject private var viewModel = BroadcastViewModel()
    @ObservedObject private var viewModelLampiranBroadcast = LampiranBroadcastRealm()
    
    public init(isFormBroadcast: Binding<Bool>) {
        self._isFormBroadcast = isFormBroadcast
    }
    
    private func doSubmit() async {
        do {
            guard let doc = selectedFile else {
                print("cek file tidak valid")
                return await viewModel.createBroadcast(data: inputan!, fileUrl: selectedFile, filename: fileName,lampiranURL: lampiranURL)
            }
            defer {
                print("cekDefer")
                doc.stopAccessingSecurityScopedResource()
            }
            
            if doc.startAccessingSecurityScopedResource() {
                var fileUrl : [URL] = []
                viewModelLampiranBroadcast.lampiranBroadcast.forEach { attachment in
                    // Pastikan properti url tidak nil sebelum menambahkannya ke array
                    if let url = URL(string: attachment.lampiranItem) {
                        fileUrl.append(url)
                    }
                }
                fileUrl.append(selectedFile!)
                print("cek item fileURL = \(fileUrl)")
                return await viewModel.createBroadcast(data: inputan!, fileUrl: selectedFile, filename: fileName,lampiranURL: lampiranURL)
            } else {
                print("cekDefer")
                throw AppError.applicationError(500, "File invalid")
            }
            
        } catch {
            errorService.raiseError(error: error)
        }
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
                ZStack{
                    EmptyView()
                        .onReceive(viewModel.$isSuccesPost.receive(on: DispatchQueue.main)) { isSuccessPost in
                            if(isSuccessPost == true){
                                viewModel.isError = false
                                viewModel.isLoading = false
                                viewModel.isSuccesPost = false
                                isFormBroadcast.toggle()
                            }
                            
                            print("cek isSuccess = \(isSuccessPost)")
                        }
                    if viewModel.isLoading {
                        ProgressView()
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
                                        if selectedFile != nil {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.black)
                                                .padding(4)
                                        }
                                    }
                                    .padding()
                                    
                                }
                                
                            }
                            .onTapGesture {
                                isLampiraBroadcast.toggle()
                            }
                            .padding(.horizontal)
                            
                            Section{
                                Text("Sasaran Broadcast")
                                    .padding(.top)
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(maxHeight: 50)
                                    HStack{
                                        Text("Sasaran Broadcast")
                                        Spacer()
                                    }
                                    .padding()
                                    
                                }
                                
                            }
                            .onTapGesture {
                                isKriteriaBroadcast.toggle()
                            }
                            .padding(.horizontal)
                            
                     
                            
                      
                            
                            Spacer()
                        }
                        
                        
                    }
                }
                HStack{
                    Button(action: {
                        // Action untuk tombol lihat
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
                        print("cek name file  \(selectedFileName) dan cek kriteria = \(selectedIdInstansi) dan \(selectedTargetJabatan)")
                        viewModel.isLoading.toggle()
                        
                        //Inisasi Variabel Graphql
                        let statusEnum = StatusBroadcast.draft
                        let graphQLEnum = GraphQLEnum<StatusBroadcast>(rawValue: statusEnum.rawValue)
                        let uploadfile : Upload = selectedFileName
                        let fileCover: GraphQLNullable<Upload>? = fileName != nil ? .some(uploadfile) : nil
                        var lampiranItem: GraphQLNullable<[Upload?]> = .none
                        var broadCastSyarat: GraphQLNullable<[BroadcastSyaratInput?]> = .none
                        var listLampiran: [Upload] = []
                        var listBroadcastSyarat : [BroadcastSyaratInput] = []
                        let item = viewModelLampiranBroadcast.getAttachments()
                        
                        // Lampiran Broadcast
                        item.forEach{element in
                            let item = ModelLampiran()
                            item.lampiranItem = element.lampiranItem
                            item.lampiranName = element.lampiranName
                            lampiranURL.append(item)
                            let uploadfile : Upload = element.lampiranName
                            listLampiran.append(uploadfile)
                        }
                        lampiranItem = .some(listLampiran)
                        
                        // Mkriteria Broadcast
                        selectedIdInstansi.enumerated().forEach { index, idInstansi in
                            // Lakukan sesuatu dengan indeks dan ID di sini
                            print("Index: \(index), ID: \(idInstansi)")
                            let tipeKriteria = TipeKriteria.string
                            let tipeKriteriaGraphQLEnum = GraphQLEnum<TipeKriteria>(rawValue: tipeKriteria.rawValue)
                            var broadcastSyaratInput = BroadcastSyaratInput(
                                keterangan : "inputan",
                                broadcast_syarat_kriteria : [
                                    BroadcastSyaratKriteriaInput(
                                        key: "instansi_id",
                                        value: idInstansi,
                                        tipe : tipeKriteriaGraphQLEnum
                                    ),
                                    BroadcastSyaratKriteriaInput(
                                        key: "jabatan_id",
                                        value: selectedTargetJabatan[index],
                                        tipe : tipeKriteriaGraphQLEnum
                                )
                                
                                ]
                            
                            )
                            listBroadcastSyarat.append(broadcastSyaratInput)
                        
                        }
                        broadCastSyarat = .some(listBroadcastSyarat)
                        
                        
                        inputan = CreateBroadcastsMutation(instansiId: "91", judul: judul, body: deskripsi, fileCover: fileCover ?? nil, lampiran: lampiranItem, broadCastSyarat: broadCastSyarat, publish: graphQLEnum )
                        
                        Task {
                            await doSubmit()
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
            .onAppear{
                viewModel.isError = false
                viewModel.isLoading = false
                viewModel.isSuccesPost = false
                viewModel.isSuccesGet = false
            }
            .onReceive(viewModel.$isError.receive(on: DispatchQueue.main)){ isError in
                if(isError == true){
                    viewModel.isError = false
                    viewModel.isLoading = false
                    viewModel.isSuccesPost = false
                    viewModel.isSuccesGet = false
                    showError.toggle()
                }
            }
            .alert(isPresented: $showError){
                Alert(title: Text("Terjadi Kesalahan"),message: Text("\(viewModel.errorMessage)"),dismissButton: .default(Text("OK")){
                    
                })
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
        .navigationDestination(isPresented: $isLampiraBroadcast) {
            LampiranBroadcastView(isLampiraBroadcast: $isLampiraBroadcast)
        } 
        .navigationDestination(isPresented: $isKriteriaBroadcast) {
            KriteriaBroadcastView(isKriteriaBroadcast: $isKriteriaBroadcast,selectedIdInstansi: $selectedIdInstansi,selectedTargetJabatan: $selectedTargetJabatan)
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    FormBroadcastView(isFormBroadcast: true)
//}

