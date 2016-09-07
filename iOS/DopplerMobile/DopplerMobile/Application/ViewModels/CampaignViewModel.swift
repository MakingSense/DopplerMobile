//
//  SentCampaignsViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/11/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class CampaignViewModel
{
    public private(set) var name : String
    public private(set) var campaignId: Int?
    public private(set) var sentDate: NSDate?
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
    
    init(campaign: Campaign)
    {
        self.name = campaign.name
        self.campaignId = campaign.campaignId!
        self.subject = campaign.subject
        if(campaign.scheduledDate != nil)
        {
            self.sentDate = campaign.scheduledDate
        }
        
        //TODO: check the way to calculate amountSentSubscribers, openedPercentage, bouncesPercentage and ratePercentage.
        self.amountSentSubscribers = campaign.sentCampaignReport?.totalRecipients
        if campaign.sentCampaignReport?.successFullDeliveries != 0
        {
            self.openedPercentage = (((campaign.sentCampaignReport!.uniqueOpens)! * 100) / (campaign.sentCampaignReport?.successFullDeliveries)!)
            self.unopenedPercentage = (((campaign.sentCampaignReport!.totalUnopened)! * 100) / (campaign.sentCampaignReport?.successFullDeliveries)!)
            self.bouncesPercentage = (100 - self.openedPercentage! - self.unopenedPercentage!)
            self.ratePercentage = (((campaign.sentCampaignReport!.totalClicks)! * 100) / (campaign.sentCampaignReport?.successFullDeliveries)!)
        }

        self.totalRecipients = campaign.sentCampaignReport?.totalRecipients == nil ? "--" : String(campaign.sentCampaignReport!.totalRecipients!)
        self.successFullDeliveries = campaign.sentCampaignReport?.successFullDeliveries == nil ? "--" : String(campaign.sentCampaignReport!.successFullDeliveries!)
        self.timesForwarded = campaign.sentCampaignReport?.timesForwarded == nil ? "--" : String(campaign.sentCampaignReport!.timesForwarded!)
        self.totalTimesOpened = campaign.sentCampaignReport?.totalTimesOpened == nil ? "--" : String(campaign.sentCampaignReport!.totalTimesOpened!)
        self.lastOpenDate = campaign.sentCampaignReport?.lastOpenDate == nil ? "--" : (campaign.sentCampaignReport!.lastOpenDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!
        self.uniqueClicks = campaign.sentCampaignReport?.uniqueClicks == nil ? "--" : String(campaign.sentCampaignReport!.uniqueClicks!)
        self.uniqueOpens = campaign.sentCampaignReport?.uniqueOpens == nil ? "--" : String(campaign.sentCampaignReport!.uniqueOpens!)
        self.totalClicks = campaign.sentCampaignReport?.totalClicks == nil ? "--" : String(campaign.sentCampaignReport!.totalClicks!)
        self.totalUnsubscribers = campaign.sentCampaignReport?.totalUnsubscribers == nil ? "--" : String(campaign.sentCampaignReport!.totalUnsubscribers!)
        self.lastClickDate = campaign.sentCampaignReport?.lastClickDate == nil ? "--" : (campaign.sentCampaignReport!.lastClickDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!
    }
}