//
//  User.swift
//  AppChat
//
//  Created by iOS Student on 12/30/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import Foundation

struct User {
    let id: String!
    let email: String!
    let fullName: String!
    let linkAvatar: String!
    let Avatar: UIImage!
    
    init() {
        id = ""
        email = ""
        fullName = ""
        linkAvatar = ""
        Avatar = UIImage(named: "personicon")
    }
    
    init(id: String, email: String, fullName: String, linkAvatar: String) {
        self.id = id
        self.email = email
        self.fullName = fullName
        self.linkAvatar = linkAvatar
        self.Avatar = UIImage(named: "personicon")
    }
}
