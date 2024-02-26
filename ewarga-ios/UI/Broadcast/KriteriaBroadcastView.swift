//
//  KriteriaBroadcastView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 26/02/24.
//

import SwiftUI

struct KriteriaBroadcastView: View {
    @Binding var isKriteriaBroadcast : Bool
    @Binding var selectedIdInstansi: [String]
    @Binding var selectedTargetJabatan: [String]
    @ObservedObject private var viewModel = BroadcastViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                
                if(viewModel.isLoading){
                    ProgressView()
                }
                
                
                VStack(alignment:.leading){
                    HStack{
                        Button(action: {
                            selectedIdInstansi.removeAll()
                            selectedTargetJabatan.removeAll()
                            if let selectedItem = viewModel.instansKriteriaBroadcast.first(where: { $0.nama == viewModel.selectedItemInstansiKriteria }) {
                                selectedIdInstansi.append("\(selectedItem.id)")
                            }
                            if let selectedItem = viewModel.jabatanKriteriaBroadcast.first(where: { $0 == viewModel.selectedItemJabatanKriteria }) {
                                selectedTargetJabatan.append(selectedItem)
                            }
                            print("cek item \(selectedIdInstansi) dan \(selectedTargetJabatan)")
                            isKriteriaBroadcast.toggle()
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
                        
                        Text("Kriteria Broadcast")
                            .fontWeight(.semibold)
                        Spacer()
                        
                    }
                    
                    HStack{
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(height: 56)
                            
                            
                            Picker("Pilih Item", selection: $viewModel.selectedItemInstansiKriteria) {
                                ForEach(viewModel.instansKriteriaBroadcast) { item in
                                    Text(item.nama).tag(item.nama)
                                }
                            }
                       
                            .accentColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                        }
                        .padding(.trailing)
                        
                        
                        Spacer()
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(height: 56)
                            
                            
                            Picker("Pilih Item", selection: $viewModel.selectedItemJabatanKriteria) {
                                ForEach(viewModel.jabatanKriteriaBroadcast,id: \.self) { item in
                                    Text(item)
                                }
                            }
                        
                            .accentColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                        }
                        .padding(.leading)
                    
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .padding()
                .onAppear{
                    Task{
                        await viewModel.getBroadcastKriteria()
                    }
                    viewModel.isError = false
                    viewModel.isLoading = true
                    viewModel.isSuccesPost = false
                    viewModel.isSuccesGet = false
                    
                }
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    KriteriaBroadcastView()
//}
