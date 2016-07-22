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
    @IBOutlet weak var lblCampaignName: UILabel!
    @IBOutlet weak var lblSentDate: UILabel!
    @IBOutlet weak var lblStatistics: UILabel!    
    static let identifier = "SentCampaignsCell"
    
    // MARK: Actions
    func setValues(campaignViewModel: CampaignViewModel)
    {
        self.lblCampaignName.text = campaignViewModel.name
        self.lblSentDate.text = campaignViewModel.sentDate
        self.lblStatistics.text =  "\(campaignViewModel.openedPercentage)% OPENED"
    }
}