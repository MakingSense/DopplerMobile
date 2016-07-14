//
//  LoginViewModelDelegate.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

//TODO: Modify this protocol. 
protocol LoginViewModelDelegate: class
{
    func usernameValidationFailed()
    
    func passwordValidationFailed()
    
    func loginSucceded()
    
    func loginFailed()
}