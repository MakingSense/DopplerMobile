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
    var token: String
    //TODO: Add tokenExpirationDate
    
    init(username: String, token: String)
    {
        self.username = username
        self.token = token
    }
}