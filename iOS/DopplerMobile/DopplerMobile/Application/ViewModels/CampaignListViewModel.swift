//
//  SuperViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 13/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class CampaignListViewModel
{
    //TODO: Validate whether this class is really needed now.
    var contentDelegate: DataSourceContentDelegate?
    var campaignsService: CampaignsService!
    
    @objc func OnNotificationArrived(_ notification: Notification)
    {
        if(notification.object != nil)
        {
            var sentCampaigns = [CampaignViewModel]()
            let campaigns = notification.object as! [Campaign]
            for campaign in campaigns {
                sentCampaigns.append(CampaignViewModel(campaign: campaign))
            }
            contentDelegate?.updateContent(sentCampaigns as AnyObject)
        }
        else
        {
            //TODO: Show error.
        }
    }
}
