//
//  SentCampaignsService.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

open class CampaignsService
{
    func downloadCampaigns(_ status: CampaignStatus, pageNumber: Int, notification: String)
    {
        let completionHandler: (Result<[Campaign]>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting campaigns data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaigns)
        }
        DMApiManager.sharedInstance.getCampaigns(status, pageNumber: pageNumber, completionHandler: completionHandler)
    }
    
    func downloadCampaignReport(_ campaignId: Int, notification: String)
    {
        let completionHandler: (Result<SentCampaignReport>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let report = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting campaign report data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: report)
        }
        DMApiManager.sharedInstance.getCampaignReport(campaignId, completionHandler: completionHandler)
    }
    
    
    func downloadCampaignPreview(_ campaignId: Int, notification: String)
    {
        let completionHandler: (URL?) -> Void =
            { result in
//                guard result != nil else
//                {
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: notification), object: String(describing: "Error getting campaign preview data."))
//                    return
//                }
//                guard let preview = result else
//                {
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: notification), object: "Error getting campaign preview data.")
//                    return
//                }
                //TODO: For demo purposes use the following lines:
                let url = URL (string: "http://vp.dplract.com/00dc56c471939cca");
                NotificationCenter.default.post(name: Notification.Name(rawValue: notification), object:url)
        }
        DMApiManager.sharedInstance.getCampaignPreview(campaignId, completionHandler: completionHandler)
    }
}
