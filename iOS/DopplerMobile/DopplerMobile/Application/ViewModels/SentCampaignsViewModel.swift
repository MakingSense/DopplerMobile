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
    public private(set) var unopenedPercentage: Int?
    public private(set) var bouncesPercentage: Int?
    public private(set) var ratePercentage: Int?
    public private(set) var subject: String?
    public private(set) var totalRecipients: String
    public private(set) var successFullDeliveries: String
    public private(set) var timesForwarded: String
    public private(set) var totalTimesOpened: String
    public private(set) var lastOpenDate: String
    public private(set) var uniqueClicks: String
    public private(set) var uniqueOpens: String
    public private(set) var totalClicks: String
    public private(set) var lastClickDate: String
    public private(set) var totalUnsubscribers: String
    
    init(sentCampaign: SentCampaign)
    {
        self.name = sentCampaign.name
        self.subject = sentCampaign.subject
        if(sentCampaign.scheduledDate != nil)
        {
            self.sentDate = sentCampaign.scheduledDate?.toStringWithFormat("yyyy-MM-dd")
        }
        else
        {
            self.sentDate = "No Date"
        }
        
        //TODO: check the way to calculate amountSentSubscribers, openedPercentage, bouncesPercentage and ratePercentage.
        self.amountSentSubscribers = sentCampaign.sentCampaignReport?.totalRecipients
        if sentCampaign.sentCampaignReport?.successFullDeliveries != 0
        {
            self.openedPercentage = (((sentCampaign.sentCampaignReport!.uniqueOpens)! * 100) / (sentCampaign.sentCampaignReport?.successFullDeliveries)!)
            self.unopenedPercentage = (((sentCampaign.sentCampaignReport!.totalUnopened)! * 100) / (sentCampaign.sentCampaignReport?.successFullDeliveries)!)
            self.bouncesPercentage = (100 - self.openedPercentage! - self.unopenedPercentage!)
            self.ratePercentage = (((sentCampaign.sentCampaignReport!.totalClicks)! * 100) / (sentCampaign.sentCampaignReport?.successFullDeliveries)!)
        }

        self.totalRecipients = sentCampaign.sentCampaignReport?.totalRecipients == nil ? "--" : String(sentCampaign.sentCampaignReport!.totalRecipients!)
        self.successFullDeliveries = sentCampaign.sentCampaignReport?.successFullDeliveries == nil ? "--" : String(sentCampaign.sentCampaignReport!.successFullDeliveries!)
        self.timesForwarded = sentCampaign.sentCampaignReport?.timesForwarded == nil ? "--" : String(sentCampaign.sentCampaignReport!.timesForwarded!)
        self.totalTimesOpened = sentCampaign.sentCampaignReport?.totalTimesOpened == nil ? "--" : String(sentCampaign.sentCampaignReport!.totalTimesOpened!)
        self.lastOpenDate = sentCampaign.sentCampaignReport?.lastOpenDate == nil ? "--" : (sentCampaign.sentCampaignReport!.lastOpenDate?.toStringWithFormat("yyyy-MM-dd"))!
        self.uniqueClicks = sentCampaign.sentCampaignReport?.uniqueClicks == nil ? "--" : String(sentCampaign.sentCampaignReport!.uniqueClicks!)
        self.uniqueOpens = sentCampaign.sentCampaignReport?.uniqueOpens == nil ? "--" : String(sentCampaign.sentCampaignReport!.uniqueOpens!)
        self.totalClicks = sentCampaign.sentCampaignReport?.totalClicks == nil ? "--" : String(sentCampaign.sentCampaignReport!.totalClicks!)
        self.totalUnsubscribers = sentCampaign.sentCampaignReport?.totalUnsubscribers == nil ? "--" : String(sentCampaign.sentCampaignReport!.totalUnsubscribers!)
        self.lastClickDate = sentCampaign.sentCampaignReport?.lastClickDate == nil ? "--" : (sentCampaign.sentCampaignReport!.lastClickDate?.toStringWithFormat("yyyy-MM-dd"))!
    }
}