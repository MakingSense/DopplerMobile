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
    private var sentCampaignsService: SentCampaignsService
    private var navigationDelegate: NavigationDelegate?
    
    init(sentCampaignsService: SentCampaignsService)
    {
        self.sentCampaignsService = sentCampaignsService
        self.sentCampaignsService.downloadSentCampaigns()
    }
}