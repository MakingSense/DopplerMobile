//
//  LoginViewModelDelegate.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: class
{
    func usernameValidationFailed()
    
    func passwordValidationFailed()
    
    func viewModelWillBeginLogin()

    func viewModelDidFinishLogin()
    
    func viewModelDidFinishLoginWithError(title: String, description: String)
}