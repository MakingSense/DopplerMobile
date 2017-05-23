//
//  DateOpenClickTableViewCell.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

class DateOpenClickTableViewCell : UITableViewCell, TableViewCellProtocol {
    
    // MARK: Constants
    static let identifier = "DateOpenClickTableViewCell"
    
    // MARK: Properties
    @IBOutlet private weak var lblDate: UILabel!
    @IBOutlet private weak var lblOpens: UILabel!
    @IBOutlet private weak var lblClicks: UILabel!
    
    // MARK: Actions
    func configure<T>(viewModel: T) {
        let periodicReportViewModel = viewModel as! CampaignPeriodicReportViewModel
        periodicReportViewModel.date.map{ return $0.toStringWithFormat(DateUtils.Format.MonthDay) }.bind(to: lblDate)
        periodicReportViewModel.opens.map{ return String($0) }.bind(to: lblOpens)
        periodicReportViewModel.clicks.map{ return String($0) }.bind(to: lblClicks)
    }
}
