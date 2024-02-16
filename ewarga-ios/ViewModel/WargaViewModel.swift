//
//  WargaViewModel.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import Foundation
import Apollo
import EwargaGrapqlApi

class WargaViewModel : ObservableObject {
    
    func load(id : Int) async throws -> [EwargaGrapqlApi.GetAllWargaQuery.Data.Wargas.Datum] {
        var res = [EwargaGrapqlApi.GetAllWargaQuery.Data.Wargas.Datum]()
        let results = Network.shared.apollo.fetch(
            query: EwargaGrapqlApi.GetAllWargaQuery(instansiId: id))
        do {
            for try await result in results {
                if result.errors != nil {
                    throw AppError.graphError(result.errors)
                }

                if let s = result.data?.wargas.data {
                    res = s
                }
            }

            return res
        } catch {
            print(error)
            throw error
        }
    }
            
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
//    func create(data: PPDBMandiriAPI.AddSiswaInput) async throws -> Bool {
//        do {
//            let res = try await Network.shared.apollo.perform(
//                mutation: PPDBMandiriAPI.SiswaCreateMutation(siswa: data)
//            )
//            // passtikan tidak ada error
//            if res.errors != nil {
//                throw AppError.graphError(res.errors)
//            }
//            if (res.data?.userSiswaCreate) != nil {
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
