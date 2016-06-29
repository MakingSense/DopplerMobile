//
//  User.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class User
{
    public var username: String
    public var token: String
    
    init()
    {
        self.username = ""
        self.token = ""
    }
    
    init(username: String, token: String)
    {
        self.username = username
        self.token = token
    }
}