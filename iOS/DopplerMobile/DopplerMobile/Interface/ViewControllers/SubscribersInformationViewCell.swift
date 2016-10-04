//
//  SubscribersInformationViewCell.swift
//  DopplerMobile
//
//  Created by Trick Dev on 10/6/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import UIKit

class SubscribersInformationViewCell : UITableViewCell
{
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var lblFieldValue: UILabel!
    static let identifier = "SubscriberInformationCell"
    
    func configure(item: ListItem?)
    {
        self.lblFieldName.text = item?.name
        self.lblFieldValue.text = item?.value!
    }
}
