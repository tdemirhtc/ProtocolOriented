//
//  LoginServiceImpl.swift
//  UserAccountProtocolOri
//
//  Created by Hatice Taşdemir on 12.11.2024.
//

import Foundation
class LoginServiceImpl : LoginService {
    
    private let storage = UserDefaults.standard
    //sadece acceskeyi tutan değişken
    var userAccesTokenKey: String {
        return "ACCESS_TOKEN"
    }
    //burada kayıt ederiz
    func SetUserAccessToken(token: String) {
        storage.setValue(token, forKey: userAccesTokenKey)
        
    }
    
    //burada alırız
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccesTokenKey)
    }
    
    
}
