//
//  CampaignPreviewViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class CampaignPreviewViewModel
{
    private var campaignsService: CampaignsService
    
    init(campaignsService: CampaignsService, campaignId: Int)
    {
        self.campaignsService = campaignsService
        self.campaignsService.downloadCampaignPreview(campaignId, notification: NotificationIdentifier.CampaignPreviewNotification.rawValue)
    }
    
    //TODO: Get the notification message and then inform to viewController using a delegate.
}