// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllInstansiQuery: GraphQLQuery {
  public static let operationName: String = "getAllInstansi"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getAllInstansi { instansis { __typename data { __typename nama id instansi_langganan { __typename id } } } }"#
    ))

  public init() {}

  public struct Data: EwargaGrapqlApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("instansis", Instansis.self),
    ] }

    public var instansis: Instansis { __data["instansis"] }

    /// Instansis
    ///
    /// Parent Type: `InstansiPaginator`
    public struct Instansis: EwargaGrapqlApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.InstansiPaginator }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("data", [Datum].self),
      ] }

      /// A list of Instansi items.
      public var data: [Datum] { __data["data"] }

      /// Instansis.Datum
      ///
      /// Parent Type: `Instansi`
      public struct Datum: EwargaGrapqlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Instansi }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nama", String?.self),
          .field("id", EwargaGrapqlApi.ID.self),
          .field("instansi_langganan", [Instansi_langganan]?.self),
        ] }

        public var nama: String? { __data["nama"] }
        public var id: EwargaGrapqlApi.ID { __data["id"] }
        public var instansi_langganan: [Instansi_langganan]? { __data["instansi_langganan"] }

        /// Instansis.Datum.Instansi_langganan
        ///
        /// Parent Type: `InstansiLangganan`
        public struct Instansi_langganan: EwargaGrapqlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.InstansiLangganan }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", EwargaGrapqlApi.ID.self),
          ] }

          public var id: EwargaGrapqlApi.ID { __data["id"] }
        }
      }
    }
  }
}
