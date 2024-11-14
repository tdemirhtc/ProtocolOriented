//
//  LoginService.swift
//  UserAccountProtocolOri
//
//  Created by Hatice Taşdemir on 12.11.2024.
//

import Foundation

protocol LoginService {
    var userAccesTokenKey : String {get} //viewmodelda accesstoken diye verilen keyi kayıt edeceğimiz değişken ismi
    func SetUserAccessToken(token: String)
    func getUserAccessToken() -> String?
}
