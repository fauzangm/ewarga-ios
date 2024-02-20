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
    
    //    func load(id : Int) async throws -> [EwargaGrapqlApi.GetAllWargaQuery.Data.Wargas.Datum] {
    //        var res = [EwargaGrapqlApi.GetAllWargaQuery.Data.Wargas.Datum]()
    //        let results = Network.shared.apollo.fetch(
    //            query: EwargaGrapqlApi.GetAllWargaQuery(instansiId: id))
    //        do {
    //            for try await result in results {
    //                if result.errors != nil {
    //                    throw AppError.graphError(result.errors)
    //                }
    //
    //                if let s = result.data?.wargas.data {
    //                    res = s
    //                }
    //            }
    //
    //            return res
    //        } catch {
    //            print(error)
    //            throw error
    //        }
    //    }
    //
    //    func detail(id: Int) async throws -> PPDBMandiriAPI.SiswaDetailQuery.Data.SiswaProfil? {
    //        var res: PPDBMandiriAPI.SiswaDetailQuery.Data.SiswaProfil?
    //        let results = Network.shared.apollo.fetch(
    //            query: PPDBMandiriAPI.SiswaDetailQuery(siswaId: id)
    //        )
    //        do {
    //            for try await result in results {
    //                // passtikan tidak ada error
    //                if result.errors != nil {
    //                    throw AppError.graphError(result.errors)
    //                }
    //
    //                if let s = result.data?.siswaProfil {
    //                    res = s
    //                }
    //            }
    //            return res
    //        } catch {
    //            print(error)
    //            throw error
    //        }
    //    }
    //
    //    func update(id: Int, update: PPDBMandiriAPI.AddSiswaInput) async throws -> Bool {
    //        do {
    //            let res = try await Network.shared.apollo.perform(
    //                mutation: PPDBMandiriAPI.SiswaUpdateMutation(siswaId: id, siswa: update)
    //            )
    //            // passtikan tidak ada error
    //            if res.errors != nil {
    //                throw AppError.graphError(res.errors)
    //            }
    //            if (res.data?.siswaProfilUpdate?.id) != nil {
    //                return true
    //            }
    //
    //            return false
    //        } catch {
    //            print(error)
    //            throw error
    //        }
    //    }
    //
    func create(data: EwargaGrapqlApi.CreateBroadcastsMutation,fileUrl : URL,filename:String) async throws -> Bool {
        do {
            let imageExt = (filename as NSString).pathExtension.lowercased()
            print("cek ext \(imageExt)")
            let file = try GraphQLFile(fieldName: "fileCover", originalName: filename, mimeType: "application/\(imageExt)", fileURL: fileUrl)
            let res = try await Network.shared.apollo.upload(
                operation: data,
                files: [file]
            )
            
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
            if res.errors != nil {
                throw AppError.graphError(res.errors)
            }
            if (res.data?.broadcastCreate) != nil {
                return true
            }
            
            
            return false
        } catch {
            print(error)
            throw error
        }
    }
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
