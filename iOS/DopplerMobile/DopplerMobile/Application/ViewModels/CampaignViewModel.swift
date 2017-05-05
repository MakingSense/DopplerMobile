//
//  SentCampaignsViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/11/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Bond

final class CampaignViewModel {
    let name = Observable<String>("")
    private(set) var campaignId: Int?
    private(set) var sentDate: Date?
    let amountSentSubscribers = Observable<Int>(0)
    let openedPercentage = Observable<Int>(0)
    let unopenedPercentage = Observable<Int>(0)
    let bouncesPercentage = Observable<Int>(0)
    let ratePercentage = Observable<Int>(0)
    let subject = Observable<String>("")
    let fromEmail = Observable<String>("")
    let fromName = Observable<String>("")
    let preheader = Observable<String>("")
    let deliveryRateIndicators = MutableObservableArray<ListItem>([])
    let campaignBasicInformation = MutableObservableArray<ListItem>([])
    
    init(campaign: Campaign) {
        name.value = campaign.name
        campaignId = campaign.campaignId!
        subject.value = campaign.subject
        fromName.value = campaign.fromName
        fromEmail.value = campaign.fromEmail
        preheader.value = campaign.preheader == nil ? "" : campaign.preheader!
        
        if let scheduledDate = campaign.scheduledDate as Date? {
            sentDate = scheduledDate
        }
        
        amountSentSubscribers.value = campaign.sentCampaignReport?.totalRecipients == nil ? 0 : campaign.sentCampaignReport!.totalRecipients!
        
        if let sentCampaignReport = campaign.sentCampaignReport, campaign.sentCampaignReport?.successFullDeliveries != 0  {
            openedPercentage.value = (((sentCampaignReport.uniqueOpens)! * 100) / (sentCampaignReport.successFullDeliveries)!)
            unopenedPercentage.value = (((sentCampaignReport.totalUnopened)! * 100) / (sentCampaignReport.successFullDeliveries)!)
            bouncesPercentage.value = (100 - openedPercentage.value - unopenedPercentage.value)
            ratePercentage.value = (((sentCampaignReport.totalClicks)! * 100) / (sentCampaignReport.successFullDeliveries)!)
        }
        
        //Campaign Delivery Rate Indicators Array.
        if let sentCampaignReport = campaign.sentCampaignReport {
            
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_TOTAL_RECIPIENTS".localized)", value: sentCampaignReport.totalRecipients == nil ? "--" : String(sentCampaignReport.totalRecipients!)), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_SUCCESSFUL_DELIVERIES".localized)", value: sentCampaignReport.successFullDeliveries == nil ? "--" : String(sentCampaignReport.successFullDeliveries!)), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_TIMES_FORWARDED".localized)", value: sentCampaignReport.timesForwarded == nil ? "--" : String(sentCampaignReport.timesForwarded!)), at: deliveryRateIndicators.count)
            
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_TOTAL_TIMES_OPENED".localized)", value: sentCampaignReport.totalTimesOpened == nil ? "--" : String(sentCampaignReport.totalTimesOpened!)), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_LAST_OPEN_DATE".localized)", value: sentCampaignReport.lastOpenDate == nil ? "--" : (sentCampaignReport.lastOpenDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_UNIQUE_CLICKS".localized)", value: sentCampaignReport.uniqueClicks == nil ? "--" : String(sentCampaignReport.uniqueClicks!)), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_UNIQUE_OPENS".localized)", value: sentCampaignReport.uniqueOpens == nil ? "--" : String(sentCampaignReport.uniqueOpens!)), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_TOTAL_CLICKS".localized)", value: sentCampaignReport.totalClicks == nil ? "--" : String(sentCampaignReport.totalClicks!)), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_LAST_CLICK_DATE".localized)", value: sentCampaignReport.lastClickDate == nil ? "--" : (sentCampaignReport.lastClickDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!), at: deliveryRateIndicators.count)
            deliveryRateIndicators.insert(ListItem(name: "\("DELIVERY_RATE_TOTAL_UNSUSCRIBERS".localized)", value: sentCampaignReport.totalUnsubscribers == nil ? "--" : String(sentCampaignReport.totalUnsubscribers!)), at: deliveryRateIndicators.count)
        }
        
        //Campaign Basic Information Array.
        campaignBasicInformation.insert(ListItem(name: "\("SCHEDULED_CAMPAIGN_NAME".localized)", value: name.value), at: campaignBasicInformation.count)
        campaignBasicInformation.insert(ListItem(name: "\("SCHEDULED_CAMPAIGN_SUBJECT".localized)", value: subject.value), at: campaignBasicInformation.count)
        campaignBasicInformation.insert(ListItem(name: "\("SCHEDULED_CAMPAIGN_PREHEADER".localized)", value: campaign.preheader == nil ? "--" : campaign.preheader!), at: campaignBasicInformation.count)
        campaignBasicInformation.insert(ListItem(name: "\("SCHEDULED_CAMPAIGN_FROM_EMAIL".localized)", value: fromEmail.value), at: campaignBasicInformation.count)
        campaignBasicInformation.insert(ListItem(name: "\("SCHEDULED_CAMPAIGN_FROM_NAME".localized)", value: fromName.value), at: campaignBasicInformation.count)
        
    }
}
