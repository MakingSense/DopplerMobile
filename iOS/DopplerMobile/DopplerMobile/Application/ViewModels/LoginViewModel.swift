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
    var username: String?
    var password: String?
    
    weak var delegate: LoginViewControllerDelegate?

    init()
    {
        username = nil
        password = nil
    }
    
    func login(username: String, password: String)
    {
        if validateInput(username, password: password)
        {
            self.username = username
            self.password = password
            //TODO:call service
            var loginSucceded = true
            if loginSucceded
            {
                delegate?.loginSucceded(self)
            }
        }        
    }
    
    private func validateInput(username: String, password: String)-> Bool
    {
        if (username == "")
        {
            delegate?.usernameValidationFailed(self)
            return false
        }
        
        if (password == "")
        {
            delegate?.passwordValidationFailed(self)
            return false
        }
        
        return true
    }
}