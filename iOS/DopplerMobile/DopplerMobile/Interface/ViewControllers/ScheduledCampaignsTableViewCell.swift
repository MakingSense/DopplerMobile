//
//  ScheduledCampaignsTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 1/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ScheduledCampaignsTableViewCell : UITableViewCell
{
    // MARK: Properties
    @IBOutlet weak var lblCampaignName: UILabel!
    @IBOutlet weak var lblCampaignDate: UILabel!
    @IBOutlet weak var lblCampaignStatistics: UILabel!
    static let identifier = "ScheduledCampaignsCell"
    
    // MARK: Actions
    func configure(campaignViewModel: SentCampaignsViewModel)
    {
        self.lblCampaignName.text = campaignViewModel.name
        self.lblCampaignDate.text = campaignViewModel.sentDate
        //TODO: Modify lblCampaignStatistics, show the rigth information.
        self.lblCampaignStatistics.text =  "2 list - 300 suscribiers"
    }
}
