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
    @Published var instansKriteriaBroadcast = [InstansiKriteriaModel]()
    @Published var jabatanKriteriaBroadcast = [String]()
    @Published var isLoading = false
    @Published var isSuccesPost = false
    @Published var isSuccesGet = false
    @Published var isError = false
    @Published var mKriteriaBroadcast = [EwargaGrapqlApi.MBroadcastSyaratKriteriaQuery.Data.MBroadcastSyaratKriterium?]()
    @Published var errorMessage = "Terjadi masalah saat menghubungi server. Silakan coba lagi nanti"
    
    func createBroadcast(data: EwargaGrapqlApi.CreateBroadcastsMutation, fileUrl: URL?, filename: String?,lampiranURL : [ModelLampiran]?) async {
        do {
//            print("cek lampiran url = \(lampiranURL)")
            _ = try await dataSource.createBroadcast(data: data, fileUrl: fileUrl, filename: filename,lampiranURL: lampiranURL)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                print("success")
                self.isSuccesPost = true
                self.isLoading = false
                self.isError = false
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                print("failed")
                self.isSuccesPost = false
                self.isLoading = false
                self.isError = true // Update isError on the main thread
                self.errorMessage = "\(error)" // Update errorMessage on the main thread
            }
        }
    }
    
    func getBroadcastKriteria() async {
        do {
            let res = try await dataSource.getKriteriaBroadcast()
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                print("succes get broadcast Kriteria")
                self.isSuccesGet = true
                self.isError = false
                self.isLoading = false
                self.mKriteriaBroadcast = res
                self.instansKriteriaBroadcast = decodeInstansiKriteriaItems(from: res[0]?.value ?? "")
                self.jabatanKriteriaBroadcast = decodeJabatanKriteriaItems(from: res[1]?.value ?? "")
                
            }
            
        } catch {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                print("failed")
                self.isSuccesGet = false
                self.isLoading = false
                self.isError = true // Update isError on the main thread
                self.errorMessage = "\(error)" // Update errorMessage on the main thread
            }
        }
    }

    
    private func decodeInstansiKriteriaItems(from jsonString: String) -> [InstansiKriteriaModel] {
          guard let jsonData = jsonString.data(using: .utf8) else { return [] }
          do {
              return try JSONDecoder().decode([InstansiKriteriaModel].self, from: jsonData)
          } catch {
              print("Error decoding JSON: \(error)")
              return []
          }
      }
    private func decodeJabatanKriteriaItems(from jsonString: String) -> [String] {
        guard let jsonData = jsonString.data(using: .utf8) else { return [] }
              do {
                  let items = try JSONDecoder().decode([JabatanKriteriaModel].self, from: jsonData)
                  return items.map { $0.nama }
              } catch {
                  print("Error decoding JSON: \(error)")
                  return []
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
