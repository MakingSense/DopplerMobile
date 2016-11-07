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
    var campaignItem: CampaignViewModel?
    var campaignSendingItem: CampaignSendingViewModel?
    var dataSource: SendingTableViewDataSource?
    
    class func instantiateFromStoryboard() -> SendingTableViewController
    {
        let storyboard = UIStoryboard(name: StoryboardName.Scheduled, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! SendingTableViewController
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        dataSource = SendingTableViewDataSource(sections: campaignSendingItem?.sections, campaignViewModel: campaignItem!)
        tableView.delegate = dataSource
        self.tableView.dataSource = dataSource//Define what it needs from the Model.
    }
    
    @IBAction func showActionSheet(_ sender: AnyObject)
    {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelCampaign = UIAlertAction(title: "SCHEDULED_ACTION_CANCEL".localized, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Campaign Canceled") //TODO: Actually cancel the campaign sending.
        })
        let backAction = UIAlertAction(title: "SCHEDULED_ACTION_BACK".localized, style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Back from Action Sheet")
        })

        optionMenu.addAction(cancelCampaign)
        optionMenu.addAction(backAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
}
