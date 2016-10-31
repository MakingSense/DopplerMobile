//
//  SendingViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 31/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingTableViewController: UITableViewController
{
    var campaignItem: CampaignSendingMockUpViewModel?
    var dataSource: SendingTableViewDataSource?
    
    class func instantiateFromStoryboard() -> SendingTableViewController
    {
        let storyboard = UIStoryboard(name: StoryboardName.Scheduled, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! SendingTableViewController
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        dataSource = SendingTableViewDataSource(sections: campaignItem?.sections)
        tableView.delegate = dataSource
        self.tableView.dataSource = dataSource//Define what it needs from the Model.
    }
}
