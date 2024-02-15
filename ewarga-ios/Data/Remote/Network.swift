//
//  Network.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Apollo
import Foundation

class Network {
    static let shared = Network()

    private(set) lazy var apollo : ApolloClient = {
        // The cache is necessary to set up the store, which we're going
        // to hand to the provider
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)

        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let url = URL(string: URL_API)!

        let requestChainTransport = RequestChainNetworkTransport(
          interceptorProvider: provider,
          endpointURL: url
        )

        // Remember to give the store you already created to the client so it
        // doesn't create one on its own
        return ApolloClient(networkTransport: requestChainTransport, store: store)
      }()
    
    
    //ApolloClient(url: URL(string: "https://backend.dev.ppdb.id/graphql")!)
}
