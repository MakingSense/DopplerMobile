//
//  DefaultFieldTableViewCell.swift
//  DopplerMobile
//
//  Created by Mugu on 11/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import TextFieldEffects

class DefaultTableViewCell: UITableViewCell
{
    @IBOutlet weak var TextField: HoshiTextField!
    static let identifier = "DefaultTableViewCell"
    static let height : CGFloat = 70

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configure(title: String)
    {
        TextField.placeholder = title
    }
}
