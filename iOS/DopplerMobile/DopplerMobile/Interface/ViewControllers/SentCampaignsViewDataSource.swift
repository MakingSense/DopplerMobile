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
    
    // MARK: Actions
    //TODO: remove this code when full implementation is ready
    func loadTest()
    {
        let test1 = CampaignViewModel()
        test1.name = "test 1"
        test1.openedPercentage = "30"
        test1.sentDate = "12/12/2012"
        test1.amountSentSubscribers = "20"
        
        let test2 = CampaignViewModel()
        test2.name = "test 2"
        test2.openedPercentage = "10"
        test2.sentDate = "10/12/2016"
        test2.amountSentSubscribers = "20"
        
        let test3 = CampaignViewModel()
        test3.name = "test 3"
        test3.openedPercentage = "25"
        test3.sentDate = "25/12/2012"
        test3.amountSentSubscribers = "20"
        
        items = [test1, test2, test3]
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(SentCampaignsTableViewCell.identifier)! as! SentCampaignsTableViewCell
        let campaignViewModel = self.items[indexPath.row]
        cell.setValues(campaignViewModel)
        return cell
    }
}