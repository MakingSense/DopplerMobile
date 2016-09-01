//
//  ScheduledCampaignsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/13/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ScheduledCampaignsViewController: DashboardViewController {
    
    // MARK: Properties
    @IBOutlet weak var tblScheduledCampaigns: UITableView!
    var dataSource : ScheduledCampaignsViewDataSource?
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblScheduledCampaigns.delegate = self
        
        //TODO: remove this when reactive is implemented.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ScheduledCampaignsViewController.OnNotificationArrived(_:)), name:NotificationIdentifier.ScheduledCampaignsNotification.rawValue, object: nil)
    }
    
    //TODO: Check the best place to receive this notification.
    @objc func OnNotificationArrived(notification: NSNotification){
        if(notification.object != nil)
        {
            var scheduledCampaigns = [SentCampaignsViewModel]()
            let campaigns = notification.object as! [Campaign]
            for campaign in campaigns {
                scheduledCampaigns.append(SentCampaignsViewModel(campaign: campaign))
            }
            self.dataSource = ScheduledCampaignsViewDataSource(viewModel: dashboardViewModel, scheduledCampaigns: scheduledCampaigns)
            self.tblScheduledCampaigns.dataSource = self.dataSource
        }
        else
        {
            //TODO: Show error.
        }
    }
    
    //TODO: remove this when reactive is implemented.
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}
