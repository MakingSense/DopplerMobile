//
//  DashboardViewController.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/18/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate
{
    // MARK: Properties
    @IBOutlet weak var tblSentCampaigns: UITableView!
    private var dashboardViewModel: DashboardViewModel!
    var dataSource : SentCampaignsViewDataSource?
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.dashboardViewModel = DashboardViewModel(sentCampaignsService: SentCampaignsService())
        self.tblSentCampaigns.delegate = self

        //TODO: remove this when reactive is implemented.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DashboardViewController.OnNotificationArrived(_:)), name:NotificationIdentifier.SentCampaignsNotification.rawValue, object: nil)
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let selectedCellIndex = self.tblSentCampaigns.indexPathForSelectedRow
        {
            let campaignReport = self.dataSource!.items[selectedCellIndex.row]
            let reportViewController = segue.destinationViewController as! ReportViewController
            reportViewController.reportItem = campaignReport
        }
    }
    
    //TODO: Check the best place to receive this notification.
    @objc func OnNotificationArrived(notification: NSNotification){
        if(notification.object != nil)
        {
            var sentCampaigns = [SentCampaignsViewModel]()
            let campaigns = notification.object as! [SentCampaign]
            for campaign in campaigns {
                sentCampaigns.append(SentCampaignsViewModel(sentCampaign: campaign))
            }
            self.dataSource = SentCampaignsViewDataSource(viewModel: dashboardViewModel, sentCampaigns: sentCampaigns)
            self.tblSentCampaigns.dataSource = self.dataSource
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
