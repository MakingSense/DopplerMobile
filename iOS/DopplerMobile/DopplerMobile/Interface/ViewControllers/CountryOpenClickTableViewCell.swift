//
//  CountryOpenClickTableViewCell.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

class CountryOpenClickTableViewCell : UITableViewCell, TableViewCellProtocol {
    
    // MARK: Constants
    static let identifier = "CountryOpenClickTableViewCell"
    
    // MARK: Properties
    @IBOutlet private weak var imgFlag: UIImageView!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblOpens: UILabel!
    
    // MARK: Actions
    func configure<T>(viewModel: T) {
        let locationReportViewModel = viewModel as! CampaignLocationReportViewModel
        locationReportViewModel.opens.map{ return String($0) }.bind(to: lblOpens)
        locationReportViewModel.country.bind(to: lblName)
    }
}
