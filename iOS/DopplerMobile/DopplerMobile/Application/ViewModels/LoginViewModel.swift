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
    public var username: String = "" {
        didSet
        {
            loginCommand.raiseCanExecuteChanged()
        }
    }
    public var password: String = "" {
        didSet
        {
            loginCommand.raiseCanExecuteChanged()
        }
    }
    public var loginCommand: Command!
    private var loginService: LoginService
    private var loginDelegate: LoginViewController?
    
    init(loginDelegate: LoginViewController?)
    {
        self.loginDelegate = loginDelegate
        self.loginService = LoginService()
        self.loginCommand = SimpleCommand(execute: loginCommandExecute , canExecute: loginCommandCanExecute)
    }
    
    //MARK: Commands
    private func loginCommandExecute()
    {
        //TODO: rename delegate and change the LoginViewModelDelegate protocol.
        if loginService.login(self.username, password: self.password)
        {
            self.loginDelegate?.loginSucceded()
        }
        else
        {
            self.loginDelegate?.loginFailed()
        }
    }
    
    private func loginCommandCanExecute()-> Bool
    {
        return  !self.username.isEmpty && !self.password.isEmpty
    }
}