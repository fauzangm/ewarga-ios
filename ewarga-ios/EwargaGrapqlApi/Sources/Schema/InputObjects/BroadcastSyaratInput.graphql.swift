// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct BroadcastSyaratInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<ID> = nil,
    broadcast_id: GraphQLNullable<ID> = nil,
    keterangan: String,
    broadcast_syarat_kriteria: GraphQLNullable<[BroadcastSyaratKriteriaInput?]> = nil
  ) {
    __data = InputDict([
      "id": id,
      "broadcast_id": broadcast_id,
      "keterangan": keterangan,
      "broadcast_syarat_kriteria": broadcast_syarat_kriteria
    ])
  }

  public var id: GraphQLNullable<ID> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var broadcast_id: GraphQLNullable<ID> {
    get { __data["broadcast_id"] }
    set { __data["broadcast_id"] = newValue }
  }

  public var keterangan: String {
    get { __data["keterangan"] }
    set { __data["keterangan"] = newValue }
  }

  public var broadcast_syarat_kriteria: GraphQLNullable<[BroadcastSyaratKriteriaInput?]> {
    get { __data["broadcast_syarat_kriteria"] }
    set { __data["broadcast_syarat_kriteria"] = newValue }
  }
}
