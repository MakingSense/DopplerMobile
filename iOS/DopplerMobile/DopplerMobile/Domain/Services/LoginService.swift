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
    let defaults = NSUserDefaults.standardUserDefaults()
    func login(username: String, password: String)
    {
        let completionHandler: (Result<User, NSError>) -> Void =
            { result in
                guard result.error == nil else {
                    NSNotificationCenter.defaultCenter().postNotificationName(NotificationIdentifier.LoginNotification.rawValue, object: String(result.error))
                    return
                }
                guard let user = result.value else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(NotificationIdentifier.LoginNotification.rawValue, object: "Error getting user data.")
                    return
                }
                Defaults[.username] = user.username
                Defaults[.accessToken] = user.token
                Defaults[.tokenExpirationDate] = user.tokenExpirationDate
                NSNotificationCenter.defaultCenter().postNotificationName(NotificationIdentifier.LoginNotification.rawValue, object: nil)
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