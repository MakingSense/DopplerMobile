//
//  LoginViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class LoginViewModel : DMLoginServiceDelegate
{
    public var username: String?
    public var password: String?
    
    public var loginCommand: Command!
    
    var loginService: DMLoginServiceProtocol
    
    weak var delegate: LoginViewModelDelegate?
    
    init(loginService: DMLoginServiceProtocol)
    {
        self.loginService = loginService
        self.loginService.delegate = self
        self.username = nil
        self.password = nil
        self.loginCommand = DelegateCommand(execute: loginCommandExecute , canExecute: loginCommandCanExecute)
    }
    
    //MARK: Commands
    
    private func loginCommandExecute()
    {
        loginService.login(self.username!, password: self.password!)
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
    
    //MARK: Login Service Delegate method's
    
    func loginServiceWillBeginLogin()
    {
        self.delegate?.viewModelWillBeginLogin()
    }
    
    func loginServiceDidFinishLogin()
    {
        self.delegate?.viewModelDidFinishLogin()
    }
    
    func loginServiceDidFinishLoginWithError(title: String, description: String)
    {
        self.delegate?.viewModelDidFinishLoginWithError(title, description: description)
    }
}