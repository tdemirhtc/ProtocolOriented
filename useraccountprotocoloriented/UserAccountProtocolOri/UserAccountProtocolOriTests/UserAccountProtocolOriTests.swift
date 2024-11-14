//
//  UserAccountProtocolOriTests.swift
//  UserAccountProtocolOriTests
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import XCTest
@testable import UserAccountProtocolOri

final class UserAccountProtocolOriTests: XCTestCase {
    
    private var viewModel : RootViewModel!
    //mockları oluşturudğumuz için atamaları yaparız:
    private var loginService : MockLoginService!
    private var output : MockRootViewModelOutput!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class. initilaze ederiz : loginservice istediğiiçin mock ederiz:
        loginService = MockLoginService()
        viewModel = RootViewModel(loginService: loginService)
        output = MockRootViewModelOutput()
        viewModel.output = output
            }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        loginService = nil
    }

    func testShowLogin_WhenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginService.storage = [:]
        viewModel.checkedLogin()
        XCTAssertEqual(output.checkArray.first, .login)
    }
    func testShowMainApp_WhenLoginStorageReturnsUserAccessToken() throws {
        loginService.storage["ACCESS_TOKEN"] = "234567"
        viewModel.checkedLogin()
        XCTAssertEqual(output.checkArray.first, .mainApp)
       
    }

    class MockLoginService : LoginService {
        var userAccesTokenKey: String {
            return "ACCESS_TOKEN"
        }
        
        //normal usersdefaultsu kullanmayacağız. ama nasıl çalışır key ve value eşleşmesi ile çalışoır  tıpkı dict. gibi.  bu yüzden taklit edeceğimiz için boş bir dict. oluşturabiliriz:
        var storage : [String : String] = [:]
        func SetUserAccessToken(token: String) {
            //ona değer olarak verilen tokenı koyabiliriz
            storage[userAccesTokenKey] = token
        }
        
        func getUserAccessToken() -> String? {
            //istenilen anahtarı vererek bu mock değeri alabilriz
            return storage[userAccesTokenKey]
        }
        
        
    }

}
class MockRootViewModelOutput : RootViewModelOutput {
    enum Check {
        case login
        case mainApp
    }
    //output olarak kontrol edeceğimizbunun ilk elemanı logine eşit mi
    var checkArray : [Check] = []
    func showLogin() {
        checkArray.append(.login)
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }
    
    
}
