//
//  ApolloError.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Foundation
import Apollo

enum AppError: Error {
    case graphError([GraphQLError]?)
    case applicationError(Int, String)
    case unknownError(String)
    case noNetwork(String) // tidak ada jaringan
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .graphError( err):
            var msg = ""
            var e = [String]()
            if let err {
                e = err.map { e in
                    return e.errorDescription ?? "Unknown error"
                }
                msg = e.joined(separator: "\n")
            } else {
                msg = "Unknown error"
            }
            
            return NSLocalizedString(
                msg,
                comment: ""
            )

        case let .applicationError(_, message):
            return NSLocalizedString(
                message,
                comment: ""
            )
        case let .unknownError(message):
            return NSLocalizedString(
                message,
                comment: ""
            )
        case let .noNetwork(message):
            return NSLocalizedString(
                message,
                comment: ""
            )
        }
    }
}
