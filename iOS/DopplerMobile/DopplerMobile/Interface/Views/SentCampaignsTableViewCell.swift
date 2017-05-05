//
//  SentCampaignsTableViewCell.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/12/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import Bond

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
        campaignViewModel.name.bind(to: lblCampaignName)
        let boldContent = " \(String(describing: campaignViewModel.amountSentSubscribers.value)) \("REPORTS_SUBSCRIBERS".localized)"
        let date = "\(campaignViewModel.sentDate!.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)) \("REPORTS_TO".localized)"
        let formattedString = NSMutableAttributedString()
        formattedString.append(text: date).append(text: boldContent, font: UIFont.boldOf(size: 14.0))
        lblSentDate.attributedText = formattedString
        campaignViewModel.openedPercentage.map{value in "\(String(describing: value))%"}.bind(to: lblOpenPercentage)
        campaignViewModel.unopenedPercentage.map{ value in "\(String(describing: value))%"}.bind(to:lblUnopenPercentage)
        campaignViewModel.bouncesPercentage.map{value in "\(String(describing: value))%"}.bind(to:lblBouncePercentage)
        selectionStyle = .none
    }
}
