//
//  LoginViewModelDelegate.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

protocol NavigationDelegate: class
{
    //TODO: implement a generic way to navigate between view model
    func showViewModel(identifier: SegueIdentifier)
}