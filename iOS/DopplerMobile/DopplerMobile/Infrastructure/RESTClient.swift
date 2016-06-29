//
//  RESTClient.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/28/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class RESTClient
{
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var token = ""
    
    func Login(username: String, password: String)-> Bool
    {
        //TODO: DM-48 Implement generic REST client
        if (username == "f")
        {
            token = "test_access_token"
        }
    
        defaults.setObject(username, forKey: "Username")
        defaults.setObject(token, forKey: "Token")
        
        //TODO: remove this when DM-48 is implemented and integrated
        let test = GetUser()
        return test.token == "test_access_token"
    }
    
    func GetUser()-> User
    {
        let user = User()
        user.username = defaults.stringForKey("Username")!
        user.token = defaults.stringForKey("Token")!
        return user
    }
}