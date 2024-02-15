//
//  InterceptorBearer.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Foundation
import Apollo
import ApolloAPI

class InterceptorBearer: ApolloInterceptor {
    enum UserError: Error {
        case noUserLoggedIn
    }

    public var id: String = UUID().uuidString

    /// Helper function to add the token then move on to the next step
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: String,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        chain.proceedAsync(
            request: request,
            response: response,
            interceptor: self,
            completion: completion
        )
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        // kalau tidak ada token, maka just pass
        guard let token = SessionTokenHolder.loadToken() else {
            // In this instance, no user is logged in, so we want to call
            // the error handler, then return to prevent further work
//            chain.handleErrorAsync(
//                UserError.noUserLoggedIn,
//                request: request,
//                response: response,
//                completion: completion
//            )
            chain.proceedAsync(
                request: request,
                response: response,
                interceptor: self,
                completion: completion
            )
            
            return
        }

        // If we've gotten here, there is a token!
//    if token.isExpired {
//      // Call an async method to renew the token
//      UserManager.shared.renewToken { [weak self] tokenRenewResult in
//        guard let self = self else {
//            return
//        }
//
//        switch tokenRenewResult {
//        case .failure(let error):
//          // Pass the token renewal error up the chain, and do
//          // not proceed further. Note that you could also wrap this in a
//          // `UserError` if you want.
//          chain.handleErrorAsync(
//            error,
//            request: request,
//            response: response,
//            completion: completion
//          )
//
//        case .success(let token):
//          // Renewing worked! Add the token and move on
//          self.addTokenAndProceed(
//            token,
//            to: request,
//            chain: chain,
//            response: response,
//            completion: completion
//          )
//        }
//      }
//    } else {
        // We don't need to wait for renewal, add token and move on
        addTokenAndProceed(
            token,
            to: request,
            chain: chain,
            response: response,
            completion: completion
        )
        // }
    }
}
