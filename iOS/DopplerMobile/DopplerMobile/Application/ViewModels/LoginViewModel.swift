//
//  LoginViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class LoginViewModel: NavigationDelegate
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
        if loginService.login(self.username, password: self.password)
        {
            //TODO: implement a generic way to navigate between view model
            ShowViewModel("loggedInSegue")
        }
    }
    
    private func loginCommandCanExecute()-> Bool
    {
        return  !self.username.isEmpty && !self.password.isEmpty
    }
    
    //TODO: implement a generic way to navigate between view model
    func ShowViewModel(identifier: String) {
        loginDelegate?.performSegueWithIdentifier(identifier, sender: loginDelegate!)
    }
}