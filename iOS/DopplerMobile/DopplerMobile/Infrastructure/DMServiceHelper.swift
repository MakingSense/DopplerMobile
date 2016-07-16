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

//    static let sharedInstance = DMServiceHelper()

    //TODO: IMPORTANT: we need to remove this
    //initialize the service with this is the only way for turn on the notification
    private let service = MSRequestService()

    func login(username: String, password: String, callback: (success:Bool, error:NSError?) -> Void)
    {
        let params : [String:AnyObject] = [ "username" : username,
                                            "password" : password
                                          ]
        
        let req = MSRequestData(method: MSTMethodsRequest.Login.rawValue, parameters: params, callback: {
            (success: Bool, error: NSError?) in
            //TODO: we need to notify the resolution of the post
            callback(success: success, error: error)
        })
        
        NSNotificationCenter.defaultCenter().postNotificationName(MSRequestService.RequestServiceNotificationKey, object: req)
    }
}