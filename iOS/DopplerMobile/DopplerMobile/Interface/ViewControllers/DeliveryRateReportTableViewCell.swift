//
//  DeliveryRateReportTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 16/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

final class DeliveryRateReportTableViewCell : UITableViewCell, TableViewCellProtocol {
    // MARK: Constants
    static let identifier = "DeliveryRateReportCell"
    
    // MARK: Properties
    @IBOutlet private weak var lblCounterName: UILabel!
    @IBOutlet private weak var lblCounterValue: UILabel!
    
    // MARK: Actions
    func configure<T>(viewModel: T) {
        let listItem = viewModel as? ListItem
        self.lblCounterName.text = listItem?.name
        self.lblCounterValue.text = listItem?.value!
    }
}
