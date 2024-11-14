//
//  RootViewModelOutput.swift
//  UserAccountProtocolOri
//
//  Created by Hatice Taşdemir on 12.11.2024.
// viewmodel ile viewcontroller interact olabilmesi için protocol oluşturur onu anyobject ile delegate forma getiririm inject ederim vc ye 

import Foundation
protocol RootViewModelOutput : AnyObject {
    func showLogin()
    func showMainApp()
}
