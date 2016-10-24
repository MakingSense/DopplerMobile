//
//  DeliveryRateReportTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 16/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class DeliveryRateReportTableViewCell : UITableViewCell, TableViewCellProtocol
{
    // MARK: Properties
    @IBOutlet fileprivate weak var lblCounterName: UILabel!
    @IBOutlet fileprivate weak var lblCounterValue: UILabel!
    static let identifier = "DeliveryRateReportCell"
    
        // MARK: Actions
    func configure<T>(viewModel: T) {
        let listItem = viewModel as? ListItem
        self.lblCounterName.text = listItem?.name
        self.lblCounterValue.text = listItem?.value!
    }
}
