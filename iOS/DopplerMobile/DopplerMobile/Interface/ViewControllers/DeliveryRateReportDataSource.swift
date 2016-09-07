//
//  DeliveryRateReportDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 16/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class DeliveryRateReportDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var viewModel: CampaignViewModel
    
    init(viewModel: CampaignViewModel)
    {
        self.viewModel = viewModel;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(DeliveryRateReportTableViewCell.identifier)! as! DeliveryRateReportTableViewCell
        cell.configure(viewModel, inidcatorIndex: indexPath.row)
        return cell
    }
}
