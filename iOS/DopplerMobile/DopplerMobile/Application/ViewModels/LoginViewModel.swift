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
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewModel.OnNotificationArrived(_:)), name:NotificationIdentifier.LoginNotification.rawValue, object: nil)
    }
    
    //MARK: Commands
    private func loginCommandExecute()
    {
        loginService.login(self.username, password: self.password)
    }
    
    private func loginCommandCanExecute() -> Bool
    {
        return !self.username.isEmpty && !self.password.isEmpty
    }
    
    @objc func OnNotificationArrived(notification: NSNotification){
        if(notification.object == nil)
        {
            navigationDelegate?.showViewModel(SegueIdentifier.LoggedInScreenSegue)
        }
        else
        {
            //TODO: Show login error.
        }
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}