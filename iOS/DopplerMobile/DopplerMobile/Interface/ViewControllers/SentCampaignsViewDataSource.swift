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
        let test1 = CampaignViewModel(name: "test 1", sentDate: "11/12/2012", amountSentSubscribers: "20", openedPercentage: "30")
        let test2 = CampaignViewModel(name: "test 2", sentDate: "12/12/2012", amountSentSubscribers: "10", openedPercentage: "4")
        let test3 = CampaignViewModel(name: "test 3", sentDate: "13/12/2012", amountSentSubscribers: "25", openedPercentage: "70")
        
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