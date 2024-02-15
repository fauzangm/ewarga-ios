//
//  NetworkInterceptorProvider.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Foundation
import Apollo
import ApolloAPI

struct NetworkInterceptorProvider: InterceptorProvider {

  // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
  // will be handed to different interceptors.
  private let store: ApolloStore
  private let client: URLSessionClient

  init(store: ApolloStore, client: URLSessionClient) {
    self.store = store
    self.client = client
  }

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    return [
      MaxRetryInterceptor(),
      CacheReadInterceptor(store: self.store),
      InterceptorBearer(),
//      RequestLoggingInterceptor(),
      NetworkFetchInterceptor(client: self.client),
//      ResponseLoggingInterceptor(),
      ResponseCodeInterceptor(),
      JSONResponseParsingInterceptor(),
      AutomaticPersistedQueryInterceptor(),
      CacheWriteInterceptor(store: self.store)
    ]
  }
}
