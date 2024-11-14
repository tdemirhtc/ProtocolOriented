//
//  UserViewModel.swift
//  ProtocolOriented
//
//  Created by Hatice Taşdemir on 11.11.2024.
// userviewmodeldan nasıl veri aktarırırz. delegate yapısı ile aktarırız

import Foundation
class UserViewModel {
    //apimanager bir userservice protocolü old için burada kullanılabilir. dependency injection gibi koyabillirim.
    weak var output : UserViewModelProtocol? //weak var sadece buna erişilince init edeilecek 
    private let userService : UserService
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username)
            case .failure(_):
                self?.output?.updateView(name: "no user", email: "no email", userName: "no username")
            }
        }
    }
}
