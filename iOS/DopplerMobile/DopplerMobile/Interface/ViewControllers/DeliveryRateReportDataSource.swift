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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryRateReportTableViewCell.identifier)! as! DeliveryRateReportTableViewCell
        cell.configure(items?[(indexPath as NSIndexPath).row])
        return cell
    }
}
