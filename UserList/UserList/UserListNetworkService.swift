//
//  UserListNetworkService.swift
//  UserList
//
//  Created by Муслим on 14.02.2024.
//

import Foundation

final class UserListNetworkService {
    
    func fetchData(completion: @escaping([User]) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) {data, _ , error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                print("Can not decode data")
                return
            }
            
            completion(users)
            
        }.resume()
    }
}
