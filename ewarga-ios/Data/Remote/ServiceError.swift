//
//  ServiceError.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import Foundation

class ServiceError: ObservableObject {
    @Published var error: Error?

    func raiseError(error: Error) {
        self.error = error
//        SentrySDK.capture(error: error)
    }
}
