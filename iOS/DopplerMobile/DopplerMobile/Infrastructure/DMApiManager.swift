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
    func loginUser(_ username: String, password: String, completionHandler: @escaping (Result<User>) -> Void)
    {
        //TODO: Remove this hardcoded information. Real account information in production environment.
        let parameters : Parameters = [
            "grant_type": "password",
            "username" : "nreal+freetest1@makingsense.com",
            "password": "1qaz2wsx"]
        
        Alamofire.request(DMApplicationRouter.getToken(parameters: parameters))
            .responseObject
            { (response: DataResponse<User>) in
                completionHandler(response.result)
        }
    }
    
    //Get Last Sent Campaigns Call.
    func getCampaigns(_ status: CampaignStatus, completionHandler: @escaping (Result<[Campaign]>) -> Void)
    {
        let parameters : Parameters = [
            "state": status.name]
        Alamofire.request(DMApplicationRouter.getCampaigns(username: Defaults[.username]!, parameters: parameters))
            .responseArray
            { (response: DataResponse<[Campaign]>) in
                completionHandler(response.result)
        }
    }
    
    //Get Campaign Preview Call.
    func getCampaignPreview(_ campaignId: Int, completionHandler: @escaping (URL?) -> Void)
    {
        Alamofire.request(DMApplicationRouter.getCampaignPreview(username: Defaults[.username]!, campaignId: campaignId))
            .response { response in // method defaults to `.post`
                guard response.error == nil else
                {
                    completionHandler(nil)
                    return
                }
                let URL = response.response?.url
                completionHandler(URL)
        }
    }
    
    //Get Suscribers Lists Call.
    func getSuscribersLists(_ completionHandler: @escaping (Result<[List]>) -> Void)
    {
        Alamofire.request(DMApplicationRouter.getSuscribersLists(username: Defaults[.username]!))
            .responseArray
            {(response: DataResponse<[List]>) in
                completionHandler(response.result)
        }
    }
    
    //Get Suscribers Call.
    func getSuscribers(_ listId: Int, completionHandler: @escaping (Result<[Suscriber]>) -> Void)
    {
        Alamofire.request(DMApplicationRouter.getSuscribers(username: Defaults[.username]!, listId: listId))
            .responseArray
            {(response: DataResponse<[Suscriber]>) in
                completionHandler(response.result)
        }
    }
}
