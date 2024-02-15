//
//  InstansiViewModel.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Foundation
import Apollo
import EwargaGrapqlApi
class InstansiViewModel: ObservableObject {
    func load() async throws -> [GetAllInstansiQuery.Data.Instansis.Datum] {
        var res = [GetAllInstansiQuery.Data.Instansis.Datum]()
        let results = Network.shared.apollo.fetch(
            query: EwargaGrapqlApi.GetAllInstansiQuery()
        )
        do {
            for try await result in results {
                if result.errors != nil {
                    throw AppError.graphError(result.errors)
                }

                if let s = result.data?.instansis.data {
                    res = s
                }
            }

            return res
        } catch {
            print(error)
            throw error
        }
    }

}
