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
    
    public var loginCommand: Command!
    
    var loginService: LoginService
    
    weak var delegate: LoginViewModelDelegate?
    
    init(loginService: LoginService)
    {
        self.loginService = loginService
        self.username = nil
        self.password = nil
        self.loginCommand = SimpleCommand(execute: loginCommandExecute , canExecute: loginCommandCanExecute)
    }
    
    //MARK: Commands
    
    private func loginCommandExecute()
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
    
    private func loginCommandCanExecute()-> Bool
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