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
    
    func createBroadcast(data: EwargaGrapqlApi.CreateBroadcastsMutation,fileUrl : URL?,filename:String?,lampiranURL : [ModelLampiran]?) async throws -> Bool {
        do {
            var arrayFile :[GraphQLFile] = []
            if(fileUrl != nil){
                let imageExt = (filename! as NSString).pathExtension.lowercased()
                let file = try GraphQLFile(fieldName: "fileCover", originalName: filename!, mimeType: "application/\(imageExt)", fileURL: fileUrl!)
                arrayFile.append(file)
            }
            lampiranURL?.enumerated().forEach { index, element in
                let lampiran = URL(string: element.lampiranItem)
                do {
                    guard let doc = lampiran else {
                        print("cek file tidak valid")
                        throw AppError.applicationError(500, "File gagal load")
                    }
                    defer {
                        print("cekDefer")
                        doc.stopAccessingSecurityScopedResource()
                    }
                    
                    if doc.startAccessingSecurityScopedResource() {
                        let file = try GraphQLFile(fieldName: "lampiran", originalName: element.lampiranName, mimeType: "application/pdf", fileURL: lampiran!)
                        arrayFile.append(file)
                    } else {
                        throw AppError.applicationError(500, "File invalid")
                    }
                    print("cek filedname \(index)")
               
                } catch {
                    // Tangani error jika terjadi
                    print("Error creating GraphQLFile: \(error)")
                }
            }
            let res = try await Network.shared.apollo.upload(
                operation: data,
                files: arrayFile
            )
            if res.errors != nil {
                throw AppError.graphError(res.errors)
            }
            if (res.data?.broadcastCreate) != nil {
//                print("\(res.data?.broadcastCreate?.id)")
                return true
            }
            return false
        } catch {
            print(error)
            throw error
        }
    }
}
