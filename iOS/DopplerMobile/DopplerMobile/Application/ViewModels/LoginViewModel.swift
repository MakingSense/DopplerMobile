//
//  LoginViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class LoginViewModel
{
    var username:String?
    var password:String?

    init()
    {
        username = nil
        password = nil
    }
    
    func login(username:String, password:String)
    {
        validateInput(username, password: password)
        self.username = username
        self.password = password
        //TODO:call service
    }
    
    private func validateInput(username: String, password:String)
    {
        //TODO: validate input
        //TODO: call delegate if errors
    }
}