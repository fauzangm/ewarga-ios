//
//  LampiranBroadcastVo.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 22/02/24.
//

import Foundation
import RealmSwift
class LampiranBroadcastVo: Object, Identifiable {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var lampiranItem : String = ""
    @objc dynamic var lampiranName : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    

}
