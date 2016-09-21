//
//  DashboardViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class SentCampaignViewModel: CampaignListViewModel
{
    init(campaignsService: CampaignsService, contentDelegate: DataSourceContentDelegate)
    {
        super.init()
        self.campaignsService = campaignsService
        self.contentDelegate = contentDelegate
        self.campaignsService.downloadCampaigns(CampaignStatus.shipped, notification: NotificationIdentifier.SentCampaignsNotification.rawValue)
        NotificationCenter.default.addObserver(self, selector: #selector(CampaignListViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.SentCampaignsNotification.rawValue), object: nil)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
}
