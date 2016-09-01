//
//  DashboardViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class DashboardViewModel
{
    private var campaignsService: CampaignsService
    private var navigationDelegate: NavigationDelegate?
    
    init(campaignsService: CampaignsService)
    {
        self.campaignsService = campaignsService
        self.campaignsService.downloadCampaigns(CampaignStatus.shipped.rawValue, notification: NotificationIdentifier.SentCampaignsNotification.rawValue)
        //TODO: I am using "draft" value, because there is not any campaign with scheduled state for this user.
        self.campaignsService.downloadCampaigns(CampaignStatus.draft.rawValue, notification: NotificationIdentifier.ScheduledCampaignsNotification.rawValue)
    }
}