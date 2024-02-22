//
//  LampiranBroadcastView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 22/02/24.
//

import SwiftUI

struct LampiranBroadcastView: View {
    @Binding var isLampiraBroadcast: Bool
    @ObservedObject var viewModel = LampiranBroadcastRealm()
    private var errorService = ServiceError()
    @State private var showPicker = false
    
    public init(isLampiraBroadcast: Binding<Bool>) {
        self._isLampiraBroadcast = isLampiraBroadcast
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                HStack{
                    Button(action: {
                        isLampiraBroadcast.toggle()
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
                    
                    Text("Lampiran Broadcast")
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                
                AttachmentListView(viewModel: viewModel)
                    
                  
                
              
                
                Spacer()
                
                
                Button(action: {
                    showPicker.toggle()
                    
                }) {
                    Text("Tambah Lampiran")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("primaryColor"))
                        .foregroundColor(.white)
                        .cornerRadius(16) // Radius tombol
                }
                .fileImporter( // File picker
                    isPresented: $showPicker,
                    allowedContentTypes: [.pdf],
                    allowsMultipleSelection: false
                ) { result in
                    do {
                        let fileURL = try result.get()
                        guard let doc = fileURL.first else {
                            throw AppError.applicationError(500, "File tidak ditemukan")
                        }
                        viewModel.addAttachment(url: doc.absoluteString,lampiranName: doc.lastPathComponent.lowercased()) // Simpan URL sebagai string
                    } catch {
                        // Tangani kesalahan
                        errorService.raiseError(error: error)
                    }
                }
                
            }
            .padding()
            
        }
        .navigationBarBackButtonHidden()
    }
}


struct AttachmentListView: View {
    @ObservedObject var viewModel: LampiranBroadcastRealm
    
    var body: some View {

            ForEach(viewModel.lampiranBroadcast) { attachment in
                AttachmentRowView(attachment: attachment, onDelete: {
                    // Memanggil fungsi deleteAttachment dari viewModel ketika tombol di tekan
                    viewModel.deleteAttachment(at: [viewModel.lampiranBroadcast.firstIndex(of: attachment)!])
                })
            }
            .padding()
       
    }
}

struct AttachmentRowView: View {
    var attachment: LampiranBroadcastVo
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            Text(attachment.lampiranName)
            Spacer()
            Button(action: {
                // Memanggil fungsi onDelete ketika tombol di tekan
                onDelete()
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
    }
}

//#Preview {
//    LampiranBroadcastView()
//}
