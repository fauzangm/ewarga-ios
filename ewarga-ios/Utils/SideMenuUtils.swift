//
//  SideMenuUtils.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Foundation
enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case warga
    case broadcast
    case logout
    
    var title: String{
        switch self {
        case .home:
            return "Beranda"
        case .warga:
            return "Warga"
        case .broadcast:
            return "Broadcast"
            
        case .logout:
            return "Logout"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .warga:
            return "favorite"
        case .broadcast:
            return "chat"
        case .logout:
            return "logout"
        }
    }
}
