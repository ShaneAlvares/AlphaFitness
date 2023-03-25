//
//  ApiManger.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-14.
//

import Foundation

class ApiManager {
    let baseUrl = "https://your-mysql-api-url.com"
    
    func loginUser(username: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        let url = URL(string: "\(baseUrl)/login.php?username=\(username)&password=\(password)")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                
                if let userId = json["id"] as? Int, let username = json["username"] as? String, let password = json["password"] as? String {
                    let user = User(id: userId, username: username, password: password)
                    completion(user, nil)
                } else {
                    completion(nil, NSError(domain: "LoginError", code: 401, userInfo: nil))
                }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
