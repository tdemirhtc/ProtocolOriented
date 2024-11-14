//
//  UserService.swift
//  ProtocolOriented
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import Foundation
//apimanagerı abstract hale getirmiş olduk ptorocol ile. unit test için önemli  
protocol UserService {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}
