//
//  LoginService.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyUserDefaults

class LoginService
{
    let defaults = UserDefaults.standard
    func login(_ username: String, password: String)
    {
        let completionHandler: (Result<User>) -> Void =
            { result in
                guard result.error == nil else {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifier.LoginNotification.rawValue), object: String(describing: result.error))
                    return
                }
                guard let user = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifier.LoginNotification.rawValue), object: "Error getting user data.")
                    return
                }
                Defaults[.username] = user.username
                Defaults[.accessToken] = user.token
                Defaults[.tokenExpirationDate] = user.tokenExpirationDate
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifier.LoginNotification.rawValue), object: nil)
        }
        DMApiManager.sharedInstance.loginUser(username, password: password, completionHandler: completionHandler)
    }
    
    func logout()
    {
        Defaults.removeAll()
    }
    
    func isUserLoggedIn() -> Bool
    {
        return !Defaults[.username].isNullOrEmpty
    }
}
