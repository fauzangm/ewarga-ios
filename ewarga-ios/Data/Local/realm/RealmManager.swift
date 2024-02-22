//
//  RealmManager.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 22/02/24.
//

import Foundation
import RealmSwift
class RealmManager {
    static let shared = RealmManager()

    private init() {}

    func configure() {
        // Specify the Realm configuration
        let config = Realm.Configuration(
            // Set the schema version. This must be incremented if your schema changes.
            schemaVersion: 2
            )
            // Define the migration block
//            migrationBlock: { migration, oldSchemaVersion in
//                if oldSchemaVersion < 1 {
//                    // Perform migration if needed, such as adding new properties
//                    migration.enumerateObjects(ofType: LampiranBroadcastVo.className()) { oldObject, newObject in
//                        // Add new property 'name' and initialize it
//                        newObject!["lampiranName"] = ""
//                    }
//                }
//            }
//        )

        // Use the configuration
        Realm.Configuration.defaultConfiguration = config

        // Open the Realm
        do {
            let realm = try Realm()
            // Perform any additional operations with the Realm instance as needed
        } catch {
            // Handle error
            print("Error opening Realm: \(error)")
        }
    }
}
