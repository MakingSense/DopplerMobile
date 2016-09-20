//
//  DeliveryRateReportTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 16/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class DeliveryRateReportTableViewCell : UITableViewCell
{
    // MARK: Properties
    @IBOutlet private weak var lblCounterName: UILabel!
    @IBOutlet private weak var lblCounterValue: UILabel!
    static let identifier = "DeliveryRateReportCell"
    
    // MARK: Actions
    func configure(item: ListItem?)
    {
        self.lblCounterName.text = item?.name
        self.lblCounterValue.text = item?.value!
    }
}
