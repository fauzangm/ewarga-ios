//
//  MainView.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel : MasterViewModel
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
     
     var body: some View {
         ZStack{
             
             TabView(selection: $selectedSideMenuTab) {
                 BerandaView(presentSideMenu: $presentSideMenu)
                     .tag(0)
                 WargaView(presentSideMenu: $presentSideMenu)
                     .tag(1)
                 BroadcastView(presentSideMenu: $presentSideMenu)
                     .tag(2)
             }
             .onChange(of: selectedSideMenuTab) { newValue in
                       if newValue == 3 {
                           // Perform logout action
                           viewModel.logout()
                       }
                   }
             
             SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
         }
     }
}


//#Preview {
//    MainView()
//}
