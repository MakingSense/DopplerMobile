//
//  ScheduledCampaignViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 13/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class ScheduledCampaignViewModel: CampaignListViewModel
{
    init(campaignsService: CampaignsService, contentDelegate: DataSourceContentDelegate)
    {
        super.init()
        self.contentDelegate = contentDelegate
        self.campaignsService = campaignsService
        //TODO: I am using "draft" value, because there is not any campaign with scheduled state for this user.
        self.campaignsService.downloadCampaigns(CampaignStatus.draft, notification: NotificationIdentifier.ScheduledCampaignsNotification.rawValue)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CampaignListViewModel.OnNotificationArrived(_:)), name:NotificationIdentifier.ScheduledCampaignsNotification.rawValue, object: nil)
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}