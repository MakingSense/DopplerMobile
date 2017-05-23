//
//  OpensClicksViewController+UITableView.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 31/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import UIKit

extension OpensClicksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellsHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? periodicReportSectionHeaderHeight : locationReportSectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: section == 0 ? "DateSectionHeader" : "CountrySectionHeader")
        return headerView;
    }
}
