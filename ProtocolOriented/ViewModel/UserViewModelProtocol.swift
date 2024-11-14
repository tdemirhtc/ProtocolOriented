//
//  UserViewModelProtocol.swift
//  ProtocolOriented
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import Foundation
//weak var yapabilmek için anyobjecte extend etmek gerek 
protocol UserViewModelProtocol : AnyObject{
    //bu func neyi iletmek isterse yeni veri gelince iletecek
    func updateView(name: String, email: String, userName: String)
}
