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
    @IBOutlet fileprivate weak var lblCampaignName: UILabel!
    @IBOutlet fileprivate weak var lblSentDate: UILabel!
    @IBOutlet fileprivate weak var lblStatistics: UILabel!
    static let identifier = "SentCampaignsCell"
    
    // MARK: Actions
    func configure(_ campaignViewModel: CampaignViewModel)
    {
        self.lblCampaignName.text = campaignViewModel.name
        self.lblSentDate.text = campaignViewModel.sentDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
        self.lblStatistics.text =  "\(campaignViewModel.openedPercentage!)% \("SENT_CAMPAIGNS_OPENED_TEXT".localized)"
    }
}
