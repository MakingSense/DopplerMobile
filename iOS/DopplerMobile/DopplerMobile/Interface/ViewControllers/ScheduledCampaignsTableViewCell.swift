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
    @IBOutlet fileprivate weak var lblCampaignName: UILabel!
    @IBOutlet fileprivate weak var lblStatisticsRigth: UILabel!
    @IBOutlet fileprivate weak var lblCampaignDate: UILabel!
    @IBOutlet fileprivate weak var lblCampaignStatistics: UILabel!
    static let identifier = "ScheduledCampaignsCell"
    
    // MARK: Actions
    func configure(_ campaignViewModel: CampaignViewModel, index: Int)
    {
        var campaignName: String
        var campaignDate: String
        var campaignStatisticsLeft: String
        var campaignStatisticsRigth: String
        
        //TODO: Remove this code after demo.
        switch index {
        case 0:
            campaignName = "February Newsletter"
            campaignDate = "Scheduled on 01/06/2016 12:00AM"
            campaignStatisticsLeft = "2 Lists"
            campaignStatisticsRigth = "200 Suscribers"
        case 1:
            campaignName = "Ferrari Newsletter"
            campaignDate = "Scheduled on 23/08/2016 12:00AM"
            campaignStatisticsLeft = "7 Lists"
            campaignStatisticsRigth = "564 Suscribers"
        case 2:
            campaignName = "Mustang Newsletter"
            campaignDate = "Scheduled on 15/05/2016 12:00AM"
            campaignStatisticsLeft = "1 Lists"
            campaignStatisticsRigth = "25 Suscribers"
        case 3:
            campaignName = "Lamborghini Newsletter"
            campaignDate = "Scheduled on 02/02/2016 12:00AM"
            campaignStatisticsLeft = "20 Lists"
            campaignStatisticsRigth = "1250 Suscribers"
        case 4:
            campaignName = "Audi Newsletter"
            campaignDate = "Scheduled on 30/01/2016 12:00AM"
            campaignStatisticsLeft = "5 Lists"
            campaignStatisticsRigth = "36 Suscribers"
        default:
            campaignName = campaignViewModel.name
            campaignDate = "Scheduled on 01/06/2016 12:00AM"
            campaignStatisticsLeft = "2 Lists"
            campaignStatisticsRigth = "200 Suscribers"
        }
        
        self.lblCampaignName.text = campaignName
        //        self.lblCampaignDate.text = campaignViewModel.sentDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
        self.lblCampaignDate.text = campaignDate
        self.lblCampaignStatistics.text =  campaignStatisticsLeft
        self.lblStatisticsRigth.text = campaignStatisticsRigth
    }
}
