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
    @IBOutlet fileprivate weak var lblCampaignName: UILabel!
    @IBOutlet fileprivate weak var lblSentDate: UILabel!
    @IBOutlet weak var lblOpenPercentage: UILabel!
    @IBOutlet weak var lblUnopenPercentage: UILabel!
    @IBOutlet weak var lblBouncePercentage: UILabel!
    static let identifier = "SentCampaignsCell"
    
    // MARK: Actions
    func configure<T>(viewModel: T) {
        let campaignViewModel = viewModel as! CampaignViewModel
        self.lblCampaignName.text = campaignViewModel.name
        let boldContent = " \(campaignViewModel.amountSentSubscribers!) \("REPORTS_SUBSCRIBERS".localized)"
        let date = "\(campaignViewModel.sentDate!.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)) \("REPORTS_TO".localized)"
        let formattedString = NSMutableAttributedString()
        formattedString.append(text: date).append(text: boldContent, font: UIFont.boldOf(size: 14.0))
        self.lblSentDate.attributedText = formattedString
        self.lblOpenPercentage.text =  campaignViewModel.openedPercentage == nil ? "0%" : "\(campaignViewModel.openedPercentage!)%"
        self.lblUnopenPercentage.text =  campaignViewModel.unopenedPercentage == nil ? "0%" : "\(campaignViewModel.unopenedPercentage!)%"
        self.lblBouncePercentage.text =  campaignViewModel.bouncesPercentage == nil ? "0%" : "\(campaignViewModel.bouncesPercentage!)%"
    }
}
