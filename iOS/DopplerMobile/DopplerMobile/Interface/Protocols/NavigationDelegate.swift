//
//  LoginViewModelDelegate.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

@objc protocol NavigationDelegate: class
{
    //TODO: implement a generic way to navigate between view model
    func showViewModel(_ identifier: String)
}
