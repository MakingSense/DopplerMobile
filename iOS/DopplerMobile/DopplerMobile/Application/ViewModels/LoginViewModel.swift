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
            let loginService = LoginService()
            let loginSucceded = loginService.Login(username, password: password)
            if loginSucceded
            {
                delegate?.loginSucceded()
            }
        }
    }
    
    private func validateInput(username: String, password: String)-> Bool
    {
        if (username == "")
        {
            delegate?.usernameValidationFailed()
            return false
        }
        
        if (password == "")
        {
            delegate?.passwordValidationFailed()
            return false
        }
        
        return true
    }
}