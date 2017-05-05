//
//  ScheduledCampaignsTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 1/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ScheduledCampaignsTableViewCell : UITableViewCell, TableViewCellProtocol
{
    // MARK: Properties
    @IBOutlet fileprivate weak var lblCampaignName: UILabel!
    @IBOutlet fileprivate weak var lblCampaignDate: UILabel!
    @IBOutlet weak var lblStatisticsRight: UILabel!
    @IBOutlet fileprivate weak var lblCampaignStatistics: UILabel!
    static let identifier = "ScheduledCampaignsCell"
    
    // MARK: Actions
    func configure<T>(viewModel: T) {
        let campaignViewModel = viewModel as! CampaignViewModel
        
        campaignViewModel.name.bind(to: lblCampaignName)
        lblCampaignDate.attributedText = prepare(date: campaignViewModel.sentDate, subscribersAmount: campaignViewModel.amountSentSubscribers.value)
        
        campaignViewModel.amountSentSubscribers.map{value in
            return value == 1 ? "\(String(describing: value)) \("REPORTS_LIST".localized)" : "\(String(describing: value)) \("REPORTS_LISTS".localized)"}.bind(to: lblCampaignStatistics)
        campaignViewModel.amountSentSubscribers.map{value in
                    return value == 1 ? "\(String(describing: value)) \("REPORTS_SUBSCRIBER".localized)" : "\(String(describing: value)) \("REPORTS_SUBSCRIBERS".localized)"
        }.bind(to: lblStatisticsRight)
    }
    
    func prepare(date: Date?, subscribersAmount: Int) -> NSMutableAttributedString
    {
        var dateString : String
        
        if(date != nil)
        {
            dateString = "SCHEDULED_CAMPAIGN_DATE_TO".localized
            dateString = dateString.replacingOccurrences(of: "{date}", with: (date?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!)
        }
        else
        {
            dateString = "SCHEDULED_CAMPAIGN_NO_DATE".localized
        }
        
        var subscribers = "SCHEDULED_CAMPAIGN_AMOUNT_SUBSCRIBERS".localized
        subscribers = subscribers.replacingOccurrences(of: "{subscribersAmount}", with: String(subscribersAmount))
        
        let formattedString = NSMutableAttributedString()
        formattedString.append(text: dateString).append(text: subscribers, font: UIFont.boldOf(size: 13.0))
        
        return formattedString
    }
}
