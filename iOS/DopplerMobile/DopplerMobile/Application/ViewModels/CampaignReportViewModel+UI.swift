//
//  CampaignReportViewModel+UI.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 31/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import UIKit

extension CampaignReportViewModel {
    
    func getUITemplate(for tableView: UITableView, at indexPath: IndexPath) -> TableViewCellProtocol {
        return tableView.dequeueReusableCell(withIdentifier: cellIdentifier()!, for: indexPath) as! TableViewCellProtocol
    }
    
    private func cellIdentifier() -> String? {
        switch self {
        case is CampaignPeriodicReportViewModel:
            return DateOpenClickTableViewCell.identifier
        case is CampaignLocationReportViewModel:
            return CountryOpenClickTableViewCell.identifier
        default:
            fatalError()
        }
    }
}
