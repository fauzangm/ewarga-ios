//
//  PageMain.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import SwiftUI

struct PageMain: View {
    @StateObject private var viewModel = MasterViewModel()
    var body: some View {
        if viewModel.isLoggin {
            MainView()
                .environmentObject(viewModel)
        }else {
            AuthView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    PageMain()
}
