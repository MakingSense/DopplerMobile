//
//  SentCampaignsViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/11/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class CampaignViewModel
{
    open fileprivate(set) var name : String
    open fileprivate(set) var campaignId: Int?
    open fileprivate(set) var sentDate: Date?
    open fileprivate(set) var amountSentSubscribers: Int?
    open fileprivate(set) var openedPercentage: Int?
    open fileprivate(set) var unopenedPercentage: Int?
    open fileprivate(set) var bouncesPercentage: Int?
    open fileprivate(set) var ratePercentage: Int?
    open fileprivate(set) var subject: String!
    open fileprivate(set) var fromEmail: String!
    open fileprivate(set) var fromName: String!
    open fileprivate(set) var preheader: String?
    open fileprivate(set) var deliveryRateIndicators: [ListItem]?
    open fileprivate(set) var campaignBasicInformation: [ListItem]?
    
    init(campaign: Campaign)
    {
        self.name = campaign.name
        self.campaignId = campaign.campaignId!
        self.subject = campaign.subject
        self.fromName = campaign.fromName
        self.fromEmail = campaign.fromEmail
        self.preheader = campaign.preheader
        
        if(campaign.scheduledDate != nil)
        {
            self.sentDate = campaign.scheduledDate as Date?
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
        
        //Campaign Delivery Rate Indicators Array.
        self.deliveryRateIndicators = [ListItem]()
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_TOTAL_RECIPIENTS".localized)", value: campaign.sentCampaignReport?.totalRecipients == nil ? "--" : String(campaign.sentCampaignReport!.totalRecipients!)))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_SUCCESSFUL_DELIVERIES".localized)", value: campaign.sentCampaignReport?.successFullDeliveries == nil ? "--" : String(campaign.sentCampaignReport!.successFullDeliveries!)))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_TIMES_FORWARDED".localized)", value: campaign.sentCampaignReport?.timesForwarded == nil ? "--" : String(campaign.sentCampaignReport!.timesForwarded!)))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_TOTAL_TIMES_OPENED".localized)", value: campaign.sentCampaignReport?.totalTimesOpened == nil ? "--" : String(campaign.sentCampaignReport!.totalTimesOpened!)))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_LAST_OPEN_DATE".localized)", value: campaign.sentCampaignReport?.lastOpenDate == nil ? "--" : (campaign.sentCampaignReport!.lastOpenDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_UNIQUE_CLICKS".localized)", value: campaign.sentCampaignReport?.uniqueClicks == nil ? "--" : String(campaign.sentCampaignReport!.uniqueClicks!)))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_UNIQUE_OPENS".localized)", value: campaign.sentCampaignReport?.uniqueOpens == nil ? "--" : String(campaign.sentCampaignReport!.uniqueOpens!)))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_TOTAL_CLICKS".localized)", value: campaign.sentCampaignReport?.totalClicks == nil ? "--" : String(campaign.sentCampaignReport!.totalClicks!)))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_LAST_CLICK_DATE".localized)", value: campaign.sentCampaignReport?.lastClickDate == nil ? "--" : (campaign.sentCampaignReport!.lastClickDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!))
        self.deliveryRateIndicators?.append(ListItem(name: "\("DELIVERY_RATE_TOTAL_UNSUSCRIBERS".localized)", value: campaign.sentCampaignReport?.totalUnsubscribers == nil ? "--" : String(campaign.sentCampaignReport!.totalUnsubscribers!)))
        
        //Campaign Basic Information Array.
        self.campaignBasicInformation = [ListItem]()
        self.campaignBasicInformation?.append(ListItem(name: "\("SCHEDULED_CAMPAIGN_NAME".localized)", value: self.name))
        self.campaignBasicInformation?.append(ListItem(name: "\("SCHEDULED_CAMPAIGN_SUBJECT".localized)", value: self.subject))
        self.campaignBasicInformation?.append(ListItem(name: "\("SCHEDULED_CAMPAIGN_PREHEADER".localized)", value: campaign.preheader == nil ? "--" : campaign.preheader!))
        self.campaignBasicInformation?.append(ListItem(name: "\("SCHEDULED_CAMPAIGN_FROM_EMAIL".localized)", value: self.fromEmail))
        self.campaignBasicInformation?.append(ListItem(name: "\("SCHEDULED_CAMPAIGN_FROM_NAME".localized)", value: self.fromName))
        
    }
}
