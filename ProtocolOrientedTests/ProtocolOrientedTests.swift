//
//  ProtocolOrientedTests.swift
//  ProtocolOrientedTests
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import XCTest
@testable import ProtocolOriented

final class ProtocolOrientedTests: XCTestCase {
    private var sut : UserViewModel!
    private var userService : MockUserService!
    private var output: MockUserViewModelProtocol!
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class. initi oldmadığı için setupda yapılır
        userService = MockUserService()
       sut = UserViewModel(userService: userService)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        userService = nil
        sut = nil
    }

    func testUpdateView_WhenAPISuccess_showsEmailNameUserName() throws {
        //api success dönerse user alabilirse kullanıcıyı gösteriyor mu testi. api isteği yapmayız mock ederiz
        let mockUser = User(id: 1, name: "Hatice", username: "Hatiç", email: "hatice@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        userService.fetchUserMockResult = .success(mockUser)
        sut.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.userName, "Hatiç")
   
    }
    
    func testUpdateView_WhenAPIFailure_showsNoUser() throws { 
        userService.fetchUserMockResult = .failure(NSError())
        sut.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "no user ")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
//userservice apimanager olarak kullandık. api kullanmak istemiyoruz. userservice protocolüne conform eden yeni bir class oluşturmak istiyorum. çünkü webe istek yapıyormuş gibi yapcağım.
class MockUserService : UserService {
    var fetchUserMockResult :Result<ProtocolOriented.User, any Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOriented.User, any Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
    
    
    
    }
class MockUserViewModelProtocol : UserViewModelProtocol {
    var updateViewArray : [(name: String, email: String, userName: String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name,email,userName))
    }
    

}


