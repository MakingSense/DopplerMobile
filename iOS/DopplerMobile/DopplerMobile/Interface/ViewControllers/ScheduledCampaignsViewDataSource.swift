//
//  ScheduledCampaignsViewDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 1/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ScheduledCampaignsViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [SentCampaignsViewModel]()
    init(viewModel: DashboardViewModel, scheduledCampaigns: [SentCampaignsViewModel]) {
        self.items = scheduledCampaigns;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(ScheduledCampaignsTableViewCell.identifier)! as! ScheduledCampaignsTableViewCell
        cell.configure(self.items[indexPath.row])
        return cell
    }
}