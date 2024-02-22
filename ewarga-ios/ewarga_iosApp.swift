//
//  ewarga_iosApp.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 13/02/24.
//

import SwiftUI

@main
struct ewarga_iosApp: App {
    init() {
         RealmManager.shared.configure()
     }
    var body: some Scene {
        WindowGroup {
            PageMain()
        }
    }
}
