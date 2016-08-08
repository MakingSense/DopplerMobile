//
//  DeliveryRateReportTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 16/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class DeliveryRateReportTableViewCell : UITableViewCell
{
    // MARK: Properties
    @IBOutlet weak var lblCounterName: UILabel!
    @IBOutlet weak var lblCounterValue: UILabel!
    static let identifier = "DeliveryRateReportCell"
    
    // MARK: Actions
    func configure(campaignViewModel: SentCampaignsViewModel, inidcatorIndex: Int)
    {
        var indicatorDescription = ""
        var indicatorValue = "--"
        switch DeliveryRateIndicators(rawValue: inidcatorIndex)
        {
        case .Some(.totalRecipients):
            indicatorDescription = "\("DELIVERY_RATE_TOTAL_RECIPIENTS".localized)"
            indicatorValue = campaignViewModel.totalRecipients
            break
        case .Some(.successFullDeliveries):
            indicatorDescription = "\("DELIVERY_RATE_SUCCESSFUL_DELIVERIES".localized)"
            indicatorValue = campaignViewModel.successFullDeliveries
            break
        case .Some(.timesForwarded):
            indicatorDescription = "\("DELIVERY_RATE_TIMES_FORWARDED".localized)"
            indicatorValue = campaignViewModel.timesForwarded
            break
        case .Some(.totalTimesOpened):
            indicatorDescription = "\("DELIVERY_RATE_TOTAL_TIMES_OPENED".localized)"
            indicatorValue = campaignViewModel.totalTimesOpened
            break
        case .Some(.lastOpenDate):
            indicatorDescription = "\("DELIVERY_RATE_LAST_OPEN_DATE".localized)"
            indicatorValue = campaignViewModel.lastOpenDate
            break
        case .Some(.uniqueClicks):
            indicatorDescription = "\("DELIVERY_RATE_UNIQUE_CLICKS".localized)"
            indicatorValue = campaignViewModel.uniqueClicks
            break
        case .Some(.uniqueOpens):
            indicatorDescription = "\("DELIVERY_RATE_UNIQUE_OPENS".localized)"
            indicatorValue = campaignViewModel.uniqueOpens
            break
        case .Some(.totalClicks):
            indicatorDescription = "\("DELIVERY_RATE_TOTAL_CLICKS".localized)"
            indicatorValue = campaignViewModel.totalClicks
            break
        case .Some(.lastClickDate):
            indicatorDescription = "\("DELIVERY_RATE_LAST_CLICK_DATE".localized)"
            indicatorValue = campaignViewModel.lastClickDate
            break
        case .Some(.totalUnsubscribers):
            indicatorDescription = "\("DELIVERY_RATE_TOTAL_UNSUSCRIBERS".localized)"
            indicatorValue = campaignViewModel.totalUnsubscribers
            break
        default:
            break
        }
        self.lblCounterName.text = indicatorDescription
        self.lblCounterValue.text = indicatorValue
    }
}
