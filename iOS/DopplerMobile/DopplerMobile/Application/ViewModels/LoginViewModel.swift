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
    public var username: String = ""
    {
        didSet { loginCommand.raiseCanExecuteChanged() }
    }
    
    public var password: String = ""
    {
        didSet { loginCommand.raiseCanExecuteChanged() }
    }
    
    public var loginCommand: Command!
    
    private var loginService: LoginService
    private var navigationDelegate: NavigationDelegate?
    
    init(loginService: LoginService, nagivationDelegate: NavigationDelegate)
    {
        self.navigationDelegate = nagivationDelegate
        self.loginService = loginService
        self.loginCommand = SimpleCommand(execute: loginCommandExecute, canExecute: loginCommandCanExecute)
    }
    
    //MARK: Commands
    private func loginCommandExecute()
    {
        if loginService.login(self.username, password: self.password)
        {
            //TODO: implement a generic way to navigate between view model
            navigationDelegate?.showViewModel(SegueIdentifier.LoggedInScreenSegue)
        }
    }
    
    private func loginCommandCanExecute() -> Bool
    {
        return !self.username.isEmpty && !self.password.isEmpty
    }
}