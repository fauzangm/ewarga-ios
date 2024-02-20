// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateBroadcastsMutation: GraphQLMutation {
  public static let operationName: String = "createBroadcasts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation createBroadcasts($instansiId: ID!, $judul: String!, $body: String!, $fileCover: Upload!, $lampiran: [Upload], $broadCastSyarat: [BroadcastSyaratInput], $publish: statusBroadcast!) { broadcastCreate( input: { instansi_id: $instansiId, judul: $judul, body: $body, status: $publish, file_cover: $fileCover, lampirans: $lampiran, broadcast_syarat: $broadCastSyarat } ) { __typename id judul } }"#
    ))

  public var instansiId: ID
  public var judul: String
  public var body: String
  public var fileCover: Upload
  public var lampiran: GraphQLNullable<[Upload?]>
  public var broadCastSyarat: GraphQLNullable<[BroadcastSyaratInput?]>
  public var publish: GraphQLEnum<StatusBroadcast>

  public init(
    instansiId: ID,
    judul: String,
    body: String,
    fileCover: Upload,
    lampiran: GraphQLNullable<[Upload?]>,
    broadCastSyarat: GraphQLNullable<[BroadcastSyaratInput?]>,
    publish: GraphQLEnum<StatusBroadcast>
  ) {
    self.instansiId = instansiId
    self.judul = judul
    self.body = body
    self.fileCover = fileCover
    self.lampiran = lampiran
    self.broadCastSyarat = broadCastSyarat
    self.publish = publish
  }

  public var __variables: Variables? { [
    "instansiId": instansiId,
    "judul": judul,
    "body": body,
    "fileCover": fileCover,
    "lampiran": lampiran,
    "broadCastSyarat": broadCastSyarat,
    "publish": publish
  ] }

  public struct Data: EwargaGrapqlApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("broadcastCreate", BroadcastCreate?.self, arguments: ["input": [
        "instansi_id": .variable("instansiId"),
        "judul": .variable("judul"),
        "body": .variable("body"),
        "status": .variable("publish"),
        "file_cover": .variable("fileCover"),
        "lampirans": .variable("lampiran"),
        "broadcast_syarat": .variable("broadCastSyarat")
      ]]),
    ] }

    public var broadcastCreate: BroadcastCreate? { __data["broadcastCreate"] }

    /// BroadcastCreate
    ///
    /// Parent Type: `Broadcast`
    public struct BroadcastCreate: EwargaGrapqlApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Broadcast }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", EwargaGrapqlApi.ID.self),
        .field("judul", String.self),
      ] }

      public var id: EwargaGrapqlApi.ID { __data["id"] }
      public var judul: String { __data["judul"] }
    }
  }
}
