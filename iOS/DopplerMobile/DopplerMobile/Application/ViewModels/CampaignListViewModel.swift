//
//  SuperViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 13/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class CampaignListViewModel
{
    var contentDelegate: DataSourceContentDelegate?
    var campaignsService: CampaignsService!
    
    @objc func OnNotificationArrived(notification: NSNotification)
    {
        if(notification.object != nil)
        {
            var sentCampaigns = [CampaignViewModel]()
            let campaigns = notification.object as! [Campaign]
            for campaign in campaigns {
                sentCampaigns.append(CampaignViewModel(campaign: campaign))
            }
            contentDelegate?.updateContent(sentCampaigns)
        }
        else
        {
            //TODO: Show error.
        }
    }
}