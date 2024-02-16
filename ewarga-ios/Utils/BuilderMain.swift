//
//  BuilderMain.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import SwiftUI

struct BuilderMain<Content: View>: View {
    @ObservedObject private var errorService: ServiceError

    let content: Content

    @State private var isAlert: Bool = false

    init(
        errorService: ServiceError = ServiceError(),
        @ViewBuilder content: () -> Content) {
        self.errorService = errorService
        self.content = content()
    }

    var body: some View {
        content
            .onReceive(errorService.$error) { val in
                isAlert = val != nil
            }
            .alert(isPresented: $isAlert) {
                Alert(
                    title: Text("Terjadi kesalahan"),
                    message: Text(errorService.error?.localizedDescription ?? "Unknown Error")
                )
            }
    }
}
