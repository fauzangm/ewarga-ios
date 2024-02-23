// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MBroadcastSyaratKriteriaQuery: GraphQLQuery {
  public static let operationName: String = "mBroadcastSyaratKriteria"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query mBroadcastSyaratKriteria { mBroadcastSyaratKriteria(instansi_id: "91") { __typename id key label tipe value } }"#
    ))

  public init() {}

  public struct Data: EwargaGrapqlApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("mBroadcastSyaratKriteria", [MBroadcastSyaratKriterium?]?.self, arguments: ["instansi_id": "91"]),
    ] }

    public var mBroadcastSyaratKriteria: [MBroadcastSyaratKriterium?]? { __data["mBroadcastSyaratKriteria"] }

    /// MBroadcastSyaratKriterium
    ///
    /// Parent Type: `MBroadcastSyaratKriteria`
    public struct MBroadcastSyaratKriterium: EwargaGrapqlApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.MBroadcastSyaratKriteria }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", EwargaGrapqlApi.ID.self),
        .field("key", String.self),
        .field("label", String.self),
        .field("tipe", String.self),
        .field("value", String?.self),
      ] }

      public var id: EwargaGrapqlApi.ID { __data["id"] }
      public var key: String { __data["key"] }
      public var label: String { __data["label"] }
      public var tipe: String { __data["tipe"] }
      public var value: String? { __data["value"] }
    }
  }
}
