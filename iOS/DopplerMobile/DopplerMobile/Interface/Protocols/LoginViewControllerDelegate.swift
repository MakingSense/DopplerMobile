//
//  LoginViewControllerDelegate.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

protocol LoginViewControllerDelegate: class
{
    func usernameValidationFailed(sender: LoginViewModel)
    
    func passwordValidationFailed(sender: LoginViewModel)
    
    func loginSucceded(sender: LoginViewModel)
}