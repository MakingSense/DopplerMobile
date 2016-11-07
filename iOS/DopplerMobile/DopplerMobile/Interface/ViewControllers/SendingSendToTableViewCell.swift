//
//  SendingSendToTableViewCell.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 10/31/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingSendToTableViewCell: UITableViewCell
{
    static let identifier = "SendingSendToTableViewCell"
    static let height : CGFloat = 138
    
    @IBOutlet weak var imgNotOpen: UIImageView!
    @IBOutlet weak var imgSoftBounce: UIImageView!
    @IBOutlet weak var imgOpened: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item: SendingCampaignSendToFieldViewModel?)
    {
        if(item?.notOpen)!
        {
            imgOpened.image = UIImage(named: "Check")
        }
        
        if(item?.softBounce)!
        {
            imgSoftBounce.image = UIImage(named: "Check")
        }
        
        if(item?.opened)!
        {
            imgOpened.image = UIImage(named: "Check")
        }
    }
}
