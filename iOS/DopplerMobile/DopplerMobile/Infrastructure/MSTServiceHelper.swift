//
//  MSTServiceHelper.swift
//  testRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Lucas Pelizza. All rights reserved.
//

import Foundation

class MSTServiceHelper
{

    static let sharedInstance = MSTServiceHelper()

    //TODO: IMPORTANT: we need to remove this
    //initialize the service with this is the only way for turn on the notification
    private let service = MSRequestService()

    func login(username: String, password: String)
    {
        let params : [String:AnyObject] = [ "username" : username,
                                            "password" : password
                                          ]
        
        let req = MSRequestData(method: MSTMethodsRequest.Login.rawValue, parameters: params, callback: {
            (success: Bool, error: NSError?) in
            //TODO: execute something
            //TODO: we need to notify the resolution of the post
        })
        
        NSNotificationCenter.defaultCenter().postNotificationName(MSRequestService.RequestServiceNotificationKey, object: req)
    }

    
    
    
//    func getAllPost()
//    {
//
//        let req = MSRequestData(method: MSTMethodsRequest.GetAllPost.rawValue, parameters: Dictionary<String, AnyObject>(), callback: {
//            (success: Bool, error: NSError?) in
//            //TODO: execute something
//        })
//
//        NSNotificationCenter.defaultCenter().postNotificationName(MSRequestService.RequestServiceNotificationKey, object: req)
//    }

}