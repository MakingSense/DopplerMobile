//
//  SuscribersListService.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

open class SuscribersService
{
    func downloadSuscribersLists(_ notification: String)
    {
        let completionHandler: (Result<[List]>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting suscribers lists data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaigns)
        }
        DMApiManager.sharedInstance.getSuscribersLists(completionHandler)
    }
    
    func downloadSuscribers(_ listId: Int, notification: String)
    {
        let completionHandler: (Result<[Suscriber]>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting suscribers data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaigns)
        }
        DMApiManager.sharedInstance.getSuscribers(listId, completionHandler: completionHandler)
    }

}
