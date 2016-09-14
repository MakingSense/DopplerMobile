//
//  SentCampaignsViewDataSource.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/19/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SentCampaignsViewDataSource<ItemType>: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [ItemType]()
    private var cellReuseIdentifier: String
    
    init(cellReuseIdentifier: String) {
        self.cellReuseIdentifier = cellReuseIdentifier
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellReuseIdentifier)! as! TableViewCellProtocol
        cell.configure(self.items[indexPath.row] as! AnyObject)
        return cell as! UITableViewCell
    }
}