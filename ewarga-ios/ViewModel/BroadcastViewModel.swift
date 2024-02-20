//
//  BroadcastViewModel.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 19/02/24.
//

import Foundation
import Apollo
import ApolloAPI
import EwargaGrapqlApi

class BroadcastViewModel : ObservableObject {
    private let dataSource  = BroadcastRepository()
    @Published var isLoading = false
    @Published var isSuccesPost = false
    @Published var isError = false
    @Published var errorMessage = "Terjadi masalah saat menghubungi server. Silakan coba lagi nanti"
    
    func createBroadcast(data: EwargaGrapqlApi.CreateBroadcastsMutation, fileUrl: URL?, filename: String?) async {
        do {
            
            _ = try await dataSource.createBroadcast(data: data, fileUrl: fileUrl, filename: filename)
            
            DispatchQueue.main.async { [weak self] in // Pastikan pembaruan dilakukan di thread utama
                guard let self = self else { return }
                print("succes")
                self.isSuccesPost.toggle()
                self.isLoading = false
            }
            
        } catch {
            DispatchQueue.main.async { [weak self] in // Pastikan pembaruan dilakukan di thread utama
                guard let self = self else { return }
                print("gagal")
                self.isLoading = false
                self.isError.toggle() // Perbarui isError di thread utama
                self.errorMessage = "\(error)" // Perbarui errorMessage di thread utama
            }
        }
    }
    
    //    func create(data: EwargaGrapqlApi.CreateBroadcastsMutation,fileUrl : URL,filename:String) async throws -> Bool {
    //        do {
    //            let imageExt = (filename as NSString).pathExtension.lowercased()
    //            print("cek ext \(imageExt)")
    //            let file = try GraphQLFile(fieldName: "fileCover", originalName: filename, mimeType: "application/\(imageExt)", fileURL: fileUrl)
    //            let res = try await Network.shared.apollo.upload(
    //                operation: data,
    //                files: [file]
    //            )
    //            if res.errors != nil {
    //                throw AppError.graphError(res.errors)
    //            }
    //            if (res.data?.broadcastCreate) != nil {
    //                return true
    //            }
    //
    //
    //            return false
    //        } catch {
    //            print(error)
    //            throw error
    //        }
    //    }
    //
    //    func drop(id: Int) async throws -> Bool {
    //        do {
    //            let res = try await Network.shared.apollo.perform(
    //                mutation: PPDBMandiriAPI.SiswaDeleteMutation(id: id)
    //            )
    //            // passtikan tidak ada error
    //            if res.errors != nil {
    //                throw AppError.graphError(res.errors)
    //            }
    //            if let dt = res.data?.userSiswaDelete {
    //                return dt
    //            }
    //
    //            return false
    //        } catch {
    //            print(error)
    //            throw error
    //        }
    //    }
}



// pengecekan Error Versi Lengkapnya
//            if let errors = res.errors {
//                for error in errors {
//                    print("Error message: \(error.message) dengan file \(file.mimeType)")
//
//                    if let extensions = error.extensions {
//                        print("Debug message: \(extensions["debugMessage"] ?? "No debug message")")
//                        print("File: \(extensions["file"] ?? "No file")")
//                        print("Line: \(extensions["line"] ?? "No line")")
//                        if let trace = extensions["trace"] as? [[String: Any]] {
//                            print("Trace:")
//                            for traceItem in trace {
//                                if let file = traceItem["file"] as? String,
//                                   let line = traceItem["line"] as? Int,
//                                   let call = traceItem["call"] as? String {
//                                    print("- File: \(file), Line: \(line), Call: \(call)")
//                                }
//                            }
//                        }
//                    }
//                }
//            }
