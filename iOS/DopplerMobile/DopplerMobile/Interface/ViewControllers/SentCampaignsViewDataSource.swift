//
//  SentCampaignsViewDataSource.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/19/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SentCampaignsViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [CampaignViewModel]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(SentCampaignsTableViewCell.identifier)! as! SentCampaignsTableViewCell
        cell.configure(self.items[indexPath.row])
        return cell
    }
}