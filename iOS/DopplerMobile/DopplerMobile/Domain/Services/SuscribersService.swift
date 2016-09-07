//
//  SuscribersListService.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

public class SuscribersService
{
    func downloadSuscribersLists(notification: String)
    {
        let completionHandler: (Result<[List], NSError>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: String(result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: "Error getting suscribers lists data.")
                    return
                }
                NSNotificationCenter.defaultCenter().postNotificationName(notification, object: campaigns)
        }
        DMApiManager.sharedInstance.getSuscribersLists(completionHandler)
    }
    
    func downloadSuscribers(listId: Int, notification: String)
    {
        let completionHandler: (Result<[Suscriber], NSError>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: String(result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: "Error getting suscribers data.")
                    return
                }
                NSNotificationCenter.defaultCenter().postNotificationName(notification, object: campaigns)
        }
        DMApiManager.sharedInstance.getSuscribers(listId, completionHandler: completionHandler)
    }

}