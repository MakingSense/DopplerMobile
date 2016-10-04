//
//  RecipientsTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 4/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class RecipientsTableViewCell : UITableViewCell
{
    // MARK: Properties
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var lblFieldValue: UILabel!
    static let identifier = "RecipientsCell"
    
    // MARK: Actions
    func configure(_ item: CampaignRecipient?)
    {
        self.lblFieldName.text = item?.name
        self.lblFieldValue.text = "\((item?.subscribersCount!)!)"
    }
}
