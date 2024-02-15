//
//  ApolloClient.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Apollo
import ApolloAPI
// based on https://github.com/apollographql/apollo-ios/issues/2216
import Foundation

extension ApolloClient {
    public func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .fetchIgnoringCacheData, //.default,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .main
    ) -> AsyncThrowingStream<GraphQLResult<Query.Data>, Error> {
        AsyncThrowingStream { continuation in
            let request = fetch(
                query: query,
                cachePolicy: cachePolicy,
                contextIdentifier: contextIdentifier,
                queue: queue
            ) { response in
                switch response {
                case let .success(result):
                    continuation.yield(result)
                    if result.isFinalForCachePolicy(cachePolicy) {
                        continuation.finish()
                    }
                case let .failure(error):
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { @Sendable _ in
                request.cancel()
            }
        }
    }

    public func watch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        callbackQueue: DispatchQueue = .main
    ) -> AsyncThrowingStream<GraphQLResult<Query.Data>, Error> {
        AsyncThrowingStream { continuation in
            let watch = watch(query: query, cachePolicy: cachePolicy, callbackQueue: callbackQueue) { result in
                switch result {
                case let .success(result):
                    continuation.yield(result)
                case let .failure(error):
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { @Sendable _ in
                watch.cancel()
            }
        }
    }

    public func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Mutation.Data> {
        try await withCheckedThrowingContinuation { continuation in
            perform(mutation: mutation, publishResultToStore: publishResultToStore, queue: queue) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func upload<Operation: GraphQLOperation>(
        operation: Operation,
        files: [GraphQLFile],
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Operation.Data> {
        try await withCheckedThrowingContinuation { continuation in
            upload(operation: operation, files: files, queue: queue) { result in
                continuation.resume(with: result)
            }
        }
    }

}

extension GraphQLResult {
    func isFinalForCachePolicy(_ cachePolicy: CachePolicy) -> Bool {
        switch cachePolicy {
        case .returnCacheDataElseFetch:
            return true
        case .fetchIgnoringCacheData:
            return source == .server
        case .fetchIgnoringCacheCompletely:
            return source == .server
        case .returnCacheDataDontFetch:
            return source == .cache
        case .returnCacheDataAndFetch:
            return source == .server
        }
    }
}
