// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllWargaQuery: GraphQLQuery {
  public static let operationName: String = "getAllWarga"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getAllWarga { wargas(instansi_id: 51) { __typename data { __typename user { __typename id name } status_perkawinan { __typename id nama } tempat_lahir tgl_lahir id nama alamat no_tlp nik warga_instansi { __typename jabatan { __typename id nama } instansi { __typename creator_id id nama } warga_instansi_peran { __typename peran { __typename id nama } } } } paginatorInfo { __typename total perPage currentPage lastPage count hasMorePages } } }"#
    ))

  public init() {}

  public struct Data: EwargaGrapqlApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wargas", Wargas.self, arguments: ["instansi_id": 51]),
    ] }

    public var wargas: Wargas { __data["wargas"] }

    /// Wargas
    ///
    /// Parent Type: `WargaPaginator`
    public struct Wargas: EwargaGrapqlApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.WargaPaginator }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("data", [Datum].self),
        .field("paginatorInfo", PaginatorInfo.self),
      ] }

      /// A list of Warga items.
      public var data: [Datum] { __data["data"] }
      /// Pagination information about the list of items.
      public var paginatorInfo: PaginatorInfo { __data["paginatorInfo"] }

      /// Wargas.Datum
      ///
      /// Parent Type: `Warga`
      public struct Datum: EwargaGrapqlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Warga }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("user", User?.self),
          .field("status_perkawinan", Status_perkawinan?.self),
          .field("tempat_lahir", String?.self),
          .field("tgl_lahir", String?.self),
          .field("id", EwargaGrapqlApi.ID.self),
          .field("nama", String.self),
          .field("alamat", String?.self),
          .field("no_tlp", String?.self),
          .field("nik", String.self),
          .field("warga_instansi", [Warga_instansi]?.self),
        ] }

        public var user: User? { __data["user"] }
        public var status_perkawinan: Status_perkawinan? { __data["status_perkawinan"] }
        public var tempat_lahir: String? { __data["tempat_lahir"] }
        public var tgl_lahir: String? { __data["tgl_lahir"] }
        public var id: EwargaGrapqlApi.ID { __data["id"] }
        public var nama: String { __data["nama"] }
        public var alamat: String? { __data["alamat"] }
        public var no_tlp: String? { __data["no_tlp"] }
        public var nik: String { __data["nik"] }
        public var warga_instansi: [Warga_instansi]? { __data["warga_instansi"] }

        /// Wargas.Datum.User
        ///
        /// Parent Type: `User`
        public struct User: EwargaGrapqlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.User }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", EwargaGrapqlApi.ID.self),
            .field("name", String.self),
          ] }

          public var id: EwargaGrapqlApi.ID { __data["id"] }
          public var name: String { __data["name"] }
        }

        /// Wargas.Datum.Status_perkawinan
        ///
        /// Parent Type: `MStatusPerkawinan`
        public struct Status_perkawinan: EwargaGrapqlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.MStatusPerkawinan }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", EwargaGrapqlApi.ID.self),
            .field("nama", String.self),
          ] }

          public var id: EwargaGrapqlApi.ID { __data["id"] }
          public var nama: String { __data["nama"] }
        }

        /// Wargas.Datum.Warga_instansi
        ///
        /// Parent Type: `WargaInstansi`
        public struct Warga_instansi: EwargaGrapqlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.WargaInstansi }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("jabatan", Jabatan?.self),
            .field("instansi", Instansi?.self),
            .field("warga_instansi_peran", [Warga_instansi_peran?]?.self),
          ] }

          public var jabatan: Jabatan? { __data["jabatan"] }
          public var instansi: Instansi? { __data["instansi"] }
          public var warga_instansi_peran: [Warga_instansi_peran?]? { __data["warga_instansi_peran"] }

          /// Wargas.Datum.Warga_instansi.Jabatan
          ///
          /// Parent Type: `Jabatan`
          public struct Jabatan: EwargaGrapqlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Jabatan }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", EwargaGrapqlApi.ID.self),
              .field("nama", String.self),
            ] }

            public var id: EwargaGrapqlApi.ID { __data["id"] }
            public var nama: String { __data["nama"] }
          }

          /// Wargas.Datum.Warga_instansi.Instansi
          ///
          /// Parent Type: `Instansi`
          public struct Instansi: EwargaGrapqlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Instansi }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("creator_id", EwargaGrapqlApi.ID.self),
              .field("id", EwargaGrapqlApi.ID.self),
              .field("nama", String?.self),
            ] }

            public var creator_id: EwargaGrapqlApi.ID { __data["creator_id"] }
            public var id: EwargaGrapqlApi.ID { __data["id"] }
            public var nama: String? { __data["nama"] }
          }

          /// Wargas.Datum.Warga_instansi.Warga_instansi_peran
          ///
          /// Parent Type: `WargaInstansiPeran`
          public struct Warga_instansi_peran: EwargaGrapqlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.WargaInstansiPeran }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("peran", Peran?.self),
            ] }

            public var peran: Peran? { __data["peran"] }

            /// Wargas.Datum.Warga_instansi.Warga_instansi_peran.Peran
            ///
            /// Parent Type: `Role`
            public struct Peran: EwargaGrapqlApi.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.Role }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", EwargaGrapqlApi.ID.self),
                .field("nama", String.self),
              ] }

              public var id: EwargaGrapqlApi.ID { __data["id"] }
              public var nama: String { __data["nama"] }
            }
          }
        }
      }

      /// Wargas.PaginatorInfo
      ///
      /// Parent Type: `PaginatorInfo`
      public struct PaginatorInfo: EwargaGrapqlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { EwargaGrapqlApi.Objects.PaginatorInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("total", Int.self),
          .field("perPage", Int.self),
          .field("currentPage", Int.self),
          .field("lastPage", Int.self),
          .field("count", Int.self),
          .field("hasMorePages", Bool.self),
        ] }

        /// Number of total available items.
        public var total: Int { __data["total"] }
        /// Number of items per page.
        public var perPage: Int { __data["perPage"] }
        /// Index of the current page.
        public var currentPage: Int { __data["currentPage"] }
        /// Index of the last available page.
        public var lastPage: Int { __data["lastPage"] }
        /// Number of items in the current page.
        public var count: Int { __data["count"] }
        /// Are there more pages after this one?
        public var hasMorePages: Bool { __data["hasMorePages"] }
      }
    }
  }
}
