//
//  SentCampaignsService.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

public class SentCampaignsService
{
    func downloadSentCampaigns()
    {
        let completionHandler: (Result<[SentCampaign], NSError>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(NotificationIdentifier.SentCampaignsNotification.rawValue, object: String(result.error))
                    return
                }
                guard let sentCampaigns = result.value else
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(NotificationIdentifier.SentCampaignsNotification.rawValue, object: "Error getting sent campaigns data.")
                    return
                }
                NSNotificationCenter.defaultCenter().postNotificationName(NotificationIdentifier.SentCampaignsNotification.rawValue, object: sentCampaigns)
        }
        DMApiManager.sharedInstance.getLastSentCampaigns(completionHandler)
    }
}