//
//  LoginViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class LoginViewModel
{
    open var username: String = ""
    {
        didSet { loginCommand.raiseCanExecuteChanged() }
    }
    
    open var password: String = ""
    {
        didSet { loginCommand.raiseCanExecuteChanged() }
    }
    
    open var loginCommand: Command!
    
    fileprivate var loginService: LoginService
    fileprivate var navigationDelegate: NavigationDelegate?
    
    init(loginService: LoginService, nagivationDelegate: NavigationDelegate)
    {
        self.navigationDelegate = nagivationDelegate
        self.loginService = loginService
        self.loginCommand = SimpleCommand(execute: loginCommandExecute, canExecute: loginCommandCanExecute)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.LoginNotification.rawValue), object: nil)
    }
    
    //MARK: Commands
    fileprivate func loginCommandExecute()
    {
        loginService.login(self.username, password: self.password)
    }
    
    fileprivate func loginCommandCanExecute() -> Bool
    {
        return !self.username.isEmpty && !self.password.isEmpty
    }
    
    @objc func OnNotificationArrived(_ notification: Notification){
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
        NotificationCenter.default.removeObserver(self)
    }
}
