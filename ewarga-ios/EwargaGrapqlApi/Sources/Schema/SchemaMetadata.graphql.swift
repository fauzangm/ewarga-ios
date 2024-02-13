// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == EwargaGrapqlApi.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == EwargaGrapqlApi.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == EwargaGrapqlApi.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == EwargaGrapqlApi.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return EwargaGrapqlApi.Objects.Query
    case "InstansiPaginator": return EwargaGrapqlApi.Objects.InstansiPaginator
    case "Instansi": return EwargaGrapqlApi.Objects.Instansi
    case "InstansiLangganan": return EwargaGrapqlApi.Objects.InstansiLangganan
    case "WargaPaginator": return EwargaGrapqlApi.Objects.WargaPaginator
    case "Warga": return EwargaGrapqlApi.Objects.Warga
    case "User": return EwargaGrapqlApi.Objects.User
    case "MStatusPerkawinan": return EwargaGrapqlApi.Objects.MStatusPerkawinan
    case "WargaInstansi": return EwargaGrapqlApi.Objects.WargaInstansi
    case "Jabatan": return EwargaGrapqlApi.Objects.Jabatan
    case "WargaInstansiPeran": return EwargaGrapqlApi.Objects.WargaInstansiPeran
    case "Role": return EwargaGrapqlApi.Objects.Role
    case "PaginatorInfo": return EwargaGrapqlApi.Objects.PaginatorInfo
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
