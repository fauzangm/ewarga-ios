//
//  SessionTokenHolder.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 15/02/24.
//

import Foundation

class SessionTokenHolder {
    // read token from user pref
    static func loadToken()-> String? {
        let defaults = UserDefaults.standard
        let tkn = defaults.object(forKey: TOKEN_KEY) as? String
        if let tkn {
            return tkn.isEmpty ? nil : tkn
        } else {
            return nil
        }
        
    }
    
    static func saveToken(_ tkn: String){
        let defaults = UserDefaults.standard
        defaults.set(tkn, forKey: TOKEN_KEY)
    }
    
    static func removeToken(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: TOKEN_KEY)
    }

    
    // token
    static func removeOnBoarding() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: ONBOARD_KEY)
    }

    static func loadOnBoarding()-> Bool {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: ONBOARD_KEY) as? Bool ?? false
    }
    
    static func saveOnBoarding(_ isShown: Bool){
        let defaults = UserDefaults.standard
        print("set on boarding flag \(isShown)")
        defaults.set(isShown, forKey: ONBOARD_KEY)
    }
}
