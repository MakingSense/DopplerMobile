//
//  SentCampaignsTableViewCell.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/12/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SentCampaignsTableViewCell : UITableViewCell, TableViewCellProtocol
{
    // MARK: Properties
    @IBOutlet weak var lblCampaignName: UILabel!
    @IBOutlet weak var lblSentDate: UILabel!
    @IBOutlet weak var lblStatistics: UILabel!
    static let identifier = "SentCampaignsCell"
    
    // MARK: Actions
    func configure(viewModel: AnyObject) {
        let campaignViewModel = viewModel as! CampaignViewModel
        self.lblCampaignName.text = campaignViewModel.name
        self.lblSentDate.text = campaignViewModel.sentDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
        self.lblStatistics.text =  "\(campaignViewModel.openedPercentage!)% \("SENT_CAMPAIGNS_OPENED_TEXT".localized)"
    }
}