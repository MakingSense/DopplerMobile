//
//  DMApiManager.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 24/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyUserDefaults

class DMApiManager: DMApiManagerProtocol
{
    static let sharedInstance = DMApiManager()
    
    //Login User Call.
    func loginUser(username: String, password: String, completionHandler: (Result<User, NSError>) -> Void) {
        //TODO: Remove this hardcoded information. Real account information in production environment.
        let parameters : [String: AnyObject] = [
            "grant_type": "password",
            "username" : "nreal+freetest1@makingsense.com",
            "password": "1qaz2wsx"]
        
        Alamofire.request(DMApplicationRouter.GetToken(parameters))
            .responseObject { (response: Response<User, NSError>) in
                completionHandler(response.result)
        }
    }
    
    //Get Last Sent Campaigns Call.
    func getCampaigns(status: String, completionHandler: (Result<[Campaign], NSError>) -> Void) {
        let parameters : [String: AnyObject] = [
            "api_key": Defaults[.accessToken]!,
            "state": status]
        
        Alamofire.request(DMApplicationRouter.GetCampaigns(Defaults[.username]!, parameters))
            .responseArray { (response: Response<[Campaign], NSError>) in
                completionHandler(response.result)
        }
    }
}
