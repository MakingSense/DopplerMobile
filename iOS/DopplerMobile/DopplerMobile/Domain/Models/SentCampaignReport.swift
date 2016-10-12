//
//  SentCampaignReport.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

class SentCampaignReport: MSResponseJSONObjectSerializable
{
    var totalRecipients: Int?
    var successFullDeliveries: Int?
    var timesForwarded: Int?
    var totalTimesOpened: Int?
    var lastOpenDate: Date?
    var uniqueClicks: Int?
    var uniqueOpens: Int?
    var totalUnopened: Int?
    var totalHardBounces: Int?
    var totalSoftBounces: Int?
    var totalClicks: Int?
    var lastClickDate: Date?
    var totalUnsubscribers: Int?
    
    required public init?(json: JSON) {
        self.totalRecipients = json["totalRecipients"].int
        self.successFullDeliveries = json["successFullDeliveries"].int
        self.uniqueOpens = json["uniqueOpens"].int
        self.totalUnopened = json["totalUnopened"].int
        self.totalClicks = json["totalClicks"].int
        self.timesForwarded = json["timesForwarded"].int
        self.totalTimesOpened = json["totalTimesOpened"].int
        self.uniqueClicks = json["uniqueClicks"].int
        self.totalHardBounces = json["totalHardBounces"].int
        self.totalSoftBounces = json["totalSoftBounces"].int
        self.totalUnsubscribers = json["totalUnsubscribers"].int
        var dateString = json["lastOpenDate"].string
        if !(dateString.isNullOrEmpty)
        {
            self.lastOpenDate = dateString!.toNSDateWithFormat(DateFormatEnum.yyyy_MM_ddTHH_mm_ss_SSSZ.pattern)
        }
        dateString = json["lastClickDate"].string
        if !(dateString.isNullOrEmpty)
        {
            self.lastClickDate = dateString!.toNSDateWithFormat(DateFormatEnum.yyyy_MM_ddTHH_mm_ss_SSSZ.pattern)
        }
    }
}
