//
//  RootViewModel.swift
//  UserAccountProtocolOri
//
//  Created by Hatice Taşdemir on 12.11.2024.
// 

import Foundation
class RootViewModel {
    private let loginService : LoginService //loginservice protocolünü getirme
    
    //vieewmodelda delegate pattern ile kullanacağım için bu şekilde protocolü atarım output içine:
    weak var output : RootViewModelOutput?
    
    init(loginService: LoginService, output: RootViewModelOutput? = nil) {
        self.loginService = loginService
        
        
    }
    
    func checkedLogin() {
        //if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty { BU KOD YERİNE SOYUTLAMA YAPILDIĞI İÇİN PROTOCOL İLE
        
        //userdefaultsu abstract yapmak gerek apimanagerı protocole koymak gibi loginservice ile soyutlama:
        if let accessToken = loginService.getUserAccessToken(), !accessToken.isEmpty {
            //showMainApp()
            output?.showMainApp()
        }else{
            //showLoginApp()
            output?.showLogin()
        }
    }
}
