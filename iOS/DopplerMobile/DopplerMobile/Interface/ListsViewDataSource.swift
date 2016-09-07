//
//  ListsViewDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ListsViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [ListDetailViewModel]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(ListsTableViewCell.identifier)! as! ListsTableViewCell
        cell.configure(self.items[indexPath.row])
        return cell
    }
}
