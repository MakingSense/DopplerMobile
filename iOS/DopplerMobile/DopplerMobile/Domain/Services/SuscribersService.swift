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
        let completionHandler: (Result<[Subscriber]>) -> Void =
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
    
    func downloadCampaignRecipients(_ campaignId: Int, notification: String)
    {
        //TODO: Add Hardcoded information to finish the task. Remove it after API modification.
        var campaignRecipients = [CampaignRecipient]()
        campaignRecipients.append(CampaignRecipient(id: "1458", name: "Graphics Designers", subscribersCount: 3))
        campaignRecipients.append(CampaignRecipient(id: "856", name: "Doctors", subscribersCount: 21))
        campaignRecipients.append(CampaignRecipient(id: "7569", name: "List 3", subscribersCount: 18))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaignRecipients)
        
        //TODO: implement the following code when the API return the correct information.
        /*let completionHandler: (Result<[CampaignRecipient]>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting campaign recipient data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaigns)
        }
        DMApiManager.sharedInstance.getCampaignRecipients(campaignId, completionHandler: completionHandler)*/
    }
}
