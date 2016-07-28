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
    private var sentCampaigns = [SentCampaignsViewModel]()
    
    init(sentCampaignsService: SentCampaignsService)
    {
        self.sentCampaignsService = sentCampaignsService
        self.downloadSentCampaigns()
    }
    
    private func downloadSentCampaigns()
    {
        //TODO: Remove this block, added for testing purpose.
        var sentCampaign: SentCampaign?
        for campaign in self.sentCampaignsService.getSentCampaigns() {
            sentCampaign = SentCampaign(dictionary: campaign)
            sentCampaigns.append(SentCampaignsViewModel(sentCampaign: sentCampaign!))
        }
    }
    
    func getSentCampaigns() -> [SentCampaignsViewModel]
    {
       return sentCampaigns
    }
}