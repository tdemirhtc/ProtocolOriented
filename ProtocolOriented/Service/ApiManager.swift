//
//  ApiManager.swift
//  ProtocolOriented
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import Foundation

class APIManager : UserService {
 
 /* static let shared = APIManager()
  
  private init() {}   singleton yapısını kullanmak istemiyorum onun yerine protocolleri kullanacağım.
  */
  func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    URLSession.shared.dataTask(with: url) { data, res, error in
      guard let data = data else { return }
      DispatchQueue.main.async {
          if let user = try? JSONDecoder().decode([User].self, from: data).first {
          completion(.success(user))
        } else {
          completion(.failure(NSError()))
        }
      }
    }.resume()
  }
  
}
