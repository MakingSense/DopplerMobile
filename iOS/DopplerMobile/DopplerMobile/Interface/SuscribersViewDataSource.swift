//
//  SuscribersDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SuscribersViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [SuscriberViewModel]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(SuscribersTableViewCell.identifier)! as! SuscribersTableViewCell
        cell.configure(self.items[indexPath.row])
        return cell
    }
}
