//
//  SentCampaignsViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/11/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class SentCampaignsViewModel
{
    public private(set) var name : String
    public private(set) var sentDate: String?
    public private(set) var amountSentSubscribers: Int?
    public private(set) var openedPercentage: Int?
    
    init(sentCampaign: SentCampaign)
    {
        self.name = sentCampaign.name
        
        if(sentCampaign.scheduledDate != nil)
        {
            self.sentDate = sentCampaign.scheduledDate?.toStringWithFormat("yyyy-MM-dd")
        }
        else
        {
            self.sentDate = "No Date"
        }
        
        //TODO: check the values for amountSentSubscribers and openedPercentage.
        self.amountSentSubscribers = sentCampaign.sentCampaignReport?.totalRecipients
        if sentCampaign.sentCampaignReport?.successFullDeliveries != 0
        {
            self.openedPercentage = (((sentCampaign.sentCampaignReport?.uniqueOpens)! * 100) / (sentCampaign.sentCampaignReport?.successFullDeliveries)!)
        }
        
    }
}