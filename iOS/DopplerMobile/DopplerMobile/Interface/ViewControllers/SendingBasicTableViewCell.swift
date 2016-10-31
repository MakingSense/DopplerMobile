//
//  SendingDefaultTableViewCell.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 10/31/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingBasicTableViewCell: UITableViewCell
{ 
    // MARK: Properties
    static let identifier = "SendingBasicTableViewCell"
    static let height : CGFloat = 51
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!   

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Actions
    func configure(_ item: SendingCampaignBasicViewModel?)
    {
        self.lblTitle.text = item?.title
        self.lblValue.text = item?.value!
    }
}
