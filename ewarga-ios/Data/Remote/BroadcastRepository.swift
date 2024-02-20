//
//  BroadcastRepository.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 20/02/24.
//

import Foundation
import Apollo
import EwargaGrapqlApi

class BroadcastRepository {
    
    func createBroadcast(data: EwargaGrapqlApi.CreateBroadcastsMutation,fileUrl : URL?,filename:String?) async throws -> Bool {
        do {
            var arrayFile :[GraphQLFile] = []
            if(fileUrl != nil){
                let imageExt = (filename! as NSString).pathExtension.lowercased()
                print("cek ext \(imageExt)")
                let file = try GraphQLFile(fieldName: "fileCover", originalName: filename!, mimeType: "application/\(imageExt)", fileURL: fileUrl!)
                arrayFile.append(file)
            }
            print("cek operation = \(data.fileCover)")
            let res = try await Network.shared.apollo.upload(
                operation: data,
                files: arrayFile
            )
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
}
