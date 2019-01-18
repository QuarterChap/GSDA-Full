//
//  UserModel.swift
//  GSDA
//
//  Created by Work on 18/01/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation

class UserModel {
    var email: String?
    var username: String?
    var id: String?
}

extension UserModel {
    static func transformUser(dict: [String: Any], key: String) -> UserModel {
        let user = UserModel()
        user.email = dict["email"] as? String
        user.username = dict["username"] as? String
        user.id = key
        return user
    }
}
