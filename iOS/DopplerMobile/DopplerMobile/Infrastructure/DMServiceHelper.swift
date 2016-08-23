//
//  DMServiceHelper.swift
//  testRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Lucas Pelizza. All rights reserved.
//

import Foundation

class DMServiceHelper : DMServiceHelperProtocol
{
    //TODO: Remove hardcode information.
    let validUserName = "nreal+freetest1@makingsense.com"
    let validPassword = "1qaz2wsx"
    
    //TODO: IMPORTANT: we need to remove this
    //initialize the service with this is the only way for turn on the notification
    private let service = MSRequestService()
    
    func login(username: String, password: String, callback: (success:Bool, error:NSError?) -> Void)
    {
        //TODO: Remove hardcode information.
        let params : [String:AnyObject] = [ "username" : validUserName,
                                            "password" : validPassword
        ]
        //TODO: Check if we need the headers here.
        let headers : [String:String] = [ "Accept" : "application/json"]
        
        let req = MSRequestData(method: MSTMethodsRequest.Login.rawValue, parameters: params, headers: headers, callback:
            {
                (success: Bool, error: NSError?) in
                //TODO: we need to notify the resolution of the post
                callback(success: success, error: error)
        })
        
        NSNotificationCenter.defaultCenter().postNotificationName(MSRequestService.RequestServiceNotificationKey, object: req)
    }
    
    func getCampains()
    {
        
    }
}