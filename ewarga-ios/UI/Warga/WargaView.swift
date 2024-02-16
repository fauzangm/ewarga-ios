//
//  WargaView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import SwiftUI
import Apollo
import EwargaGrapqlApi

struct WargaView: View {
    @Binding var presentSideMenu: Bool
    
    private var errorService = ServiceError()
    private var viewModel = WargaViewModel()
    @State private var siswas = [EwargaGrapqlApi.GetAllWargaQuery.Data.Wargas.Datum]()
    @State private var isLoading = false
    @State private var searching = ""
    
    private func doRefresh() async {
        guard !isLoading else {
            return
        }
        
        isLoading = true
        defer {
            isLoading = false
        }
        
        do {
            let res = try await viewModel.load(id: 91)
            siswas = res
        } catch {
            errorService.raiseError(error: error)
        }
    }
    
    private var filteredSiswas: [EwargaGrapqlApi.GetAllWargaQuery.Data.Wargas.Datum] {
        if searching.isEmpty {
            return siswas
        } else {
            return siswas.filter { $0.nama.lowercased().contains(searching.lowercased()) }
        }
    }
    
    
    // Change the access level of the initializer to internal or public
    init(presentSideMenu: Binding<Bool>) {
        self._presentSideMenu = presentSideMenu
    }
    
    var body: some View {
        BuilderMain(errorService: errorService){
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
                
                SearchBar(text: $searching)
                
                ScrollView {
                         VStack {
                             ForEach(filteredSiswas, id: \.id) { siswa in
                                 HStack {
                                     Text(siswa.nama)
                                         .padding(.leading, 16)
                                         .foregroundColor(.black)
                                     Spacer()
                                 }
                                 .padding()
                                 .background(Color.white)
                                 .cornerRadius(8)
                                 .shadow(radius: 4)
                                 .padding(.horizontal, 16)
                             }
                         }
                         .padding()
                        
                     }
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .background(Color("bgColor"))
        .onAppear {
            Task {
                await doRefresh()
            }
        }
        
    }
}


//#Preview {
//    WargaView()
//}


struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
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
