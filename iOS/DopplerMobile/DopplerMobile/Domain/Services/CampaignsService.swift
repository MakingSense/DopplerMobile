//
//  SentCampaignsService.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

public class CampaignsService
{
    func downloadCampaigns(status: String, notification: String)
    {
        let completionHandler: (Result<[Campaign], NSError>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: String(result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: "Error getting campaigns data.")
                    return
                }
                NSNotificationCenter.defaultCenter().postNotificationName(notification, object: campaigns)
        }
        DMApiManager.sharedInstance.getCampaigns(status, completionHandler: completionHandler)
    }
    
    func downloadCampaignPreview(campaignId: String, notification: String)
    {
        let completionHandler: (NSURL?, NSError?) -> Void =
            { result in
                guard result.1 == nil else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: String(result.1))
                    return
                }
                guard let preview = result.0 else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(notification, object: "Error getting campaign preview data.")
                    return
                }
                NSNotificationCenter.defaultCenter().postNotificationName(notification, object: preview)
        }
        DMApiManager.sharedInstance.getCampaignPreview(campaignId, completionHandler: completionHandler)
    }
}