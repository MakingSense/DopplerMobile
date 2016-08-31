//
//  SentCampaignsTableViewCell.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/12/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SentCampaignsTableViewCell : UITableViewCell
{
    // MARK: Properties
    @IBOutlet private weak var lblCampaignName: UILabel!
    @IBOutlet private weak var lblSentDate: UILabel!
    @IBOutlet private weak var lblStatistics: UILabel!
    static let identifier = "SentCampaignsCell"
    
    // MARK: Actions
    func configure(campaignViewModel: SentCampaignViewModel)
    {
        self.lblCampaignName.text = campaignViewModel.name
        self.lblSentDate.text = campaignViewModel.sentDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
        self.lblStatistics.text =  "\(campaignViewModel.openedPercentage!)% \("SENT_CAMPAIGNS_OPENED_TEXT".localized)"
    }
}