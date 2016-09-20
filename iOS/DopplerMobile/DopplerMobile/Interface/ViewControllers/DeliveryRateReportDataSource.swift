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
    var items: [ListItem]?
    init(items: [ListItem]?)
    {
        self.items = items;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (items?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(DeliveryRateReportTableViewCell.identifier)! as! DeliveryRateReportTableViewCell
        cell.configure(items?[indexPath.row])
        return cell
    }
}
