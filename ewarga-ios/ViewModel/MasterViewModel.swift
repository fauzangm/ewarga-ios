//
//  MasterViewModel.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 16/02/24.
//

import Foundation

class MasterViewModel : ObservableObject {
    @Published var isLoggin : Bool = false

    
    init(){
        if(SessionTokenHolder.loadToken()?.isEmpty == false){
            isLoggin = true
        }else{
            isLoggin = false
        }
    }
    
    func login(token : String){
        SessionTokenHolder.saveToken(token)
        isLoggin = true
    }
    
    @MainActor
    func logout() {
        SessionTokenHolder.removeToken()
        isLoggin = false
    }

}
