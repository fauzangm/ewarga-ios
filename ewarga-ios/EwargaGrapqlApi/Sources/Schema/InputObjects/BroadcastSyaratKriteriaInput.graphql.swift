// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct BroadcastSyaratKriteriaInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<ID> = nil,
    syarat_id: GraphQLNullable<ID> = nil,
    key: String,
    value: String,
    tipe: GraphQLEnum<TipeKriteria>
  ) {
    __data = InputDict([
      "id": id,
      "syarat_id": syarat_id,
      "key": key,
      "value": value,
      "tipe": tipe
    ])
  }

  public var id: GraphQLNullable<ID> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var syarat_id: GraphQLNullable<ID> {
    get { __data["syarat_id"] }
    set { __data["syarat_id"] = newValue }
  }

  public var key: String {
    get { __data["key"] }
    set { __data["key"] = newValue }
  }

  public var value: String {
    get { __data["value"] }
    set { __data["value"] = newValue }
  }

  public var tipe: GraphQLEnum<TipeKriteria> {
    get { __data["tipe"] }
    set { __data["tipe"] = newValue }
  }
}
