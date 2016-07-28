//
//  SentCampaignReport.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class SentCampaignReport
{
    var totalRecipients: Int?
    var successFullDeliveries: Int?
    var timesForwarded: Int?
    var totalTimesOpened: Int?
    var lastOpenDate: NSDate?
    var uniqueClicks: Int?
    var uniqueOpens: Int?
    var totalUnopened: Int?
    var totalHardBounces: Int?
    var totalSoftBounces: Int?
    var totalClicks: Int?
    var lastClickDate: NSDate?
    var totalUnsubscribers: Int?
    
    init()
    {
        //TODO: Create the final init method.
        self.totalRecipients = 100
        self.successFullDeliveries = 44
        self.uniqueOpens = 22
    }
}