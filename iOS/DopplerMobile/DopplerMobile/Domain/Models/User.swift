//
//  User.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class User
{
    var username: String
    var password: String
    
    init(username: String, password: String)
    {
        self.username = username
        self.password = password
    }
}