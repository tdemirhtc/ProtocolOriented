//
//  ViewController.swift
//  UserAccountProtocolOri
//
//  Created by Hatice Taşdemir on 11.11.2024.
//login var mı yok mu diye kontrol eden vc olacak bu. yoksa log in vc ye gidecek varsa main vc ye gidecek. 

import UIKit

class RootViewController: UIViewController, RootViewModelOutput{
    //viewmodeldan glecek outputa göre bu func çalışacak bunun için inject etmek gerekir:
    private let viewModel : RootViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.checkedLogin()
        
    }
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController,animated: true)
    }
    func showLogin() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController,animated: true)
    }


}

