//
//  LoginViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class LoginViewModel
{
    public var username: String?
    public var password: String?
    
    var loginService: ILoginService
    
    weak var delegate: LoginViewModelDelegate?
    
    init(loginService: ILoginService)
    {
        self.loginService = loginService
        username = nil
        password = nil
    }
    
    func login()
    {
        let loginSucceded = loginService.Login(self.username!, password: self.password!)
        if loginSucceded
        {
            delegate?.loginSucceded()
        }
        else
        {
            delegate?.loginFailed()
        }
        
    }
    
    func validateInput()-> Bool
    {
        if (self.username == "" || self.username == nil)
        {
            delegate?.usernameValidationFailed()
            return false
        }
        
        if (self.password == "" || self.password == nil)
        {
            delegate?.passwordValidationFailed()
            return false
        }
        
        return true
    }
}