//
//  SendingHeaderTableViewCell.swift
//  DopplerMobile
//
//  Created by Mugu on 11/3/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingHeaderTableViewCell: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    static let identifier = "SendingHeaderTableViewCell"
    static let height : CGFloat = 44
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setHeaderTitle(title: String)
    {
        lblTitle.text = title
    }
}
