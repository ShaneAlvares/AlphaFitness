//
//  User.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-14.
//

class User{
    var id: Int
    var username: String
    var password: String
    
    init(id: Int, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}
