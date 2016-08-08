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
        dashboardViewModel = DashboardViewModel(sentCampaignsService: SentCampaignsService())
        self.dataSource = SentCampaignsViewDataSource(viewModel: dashboardViewModel)
        tblSentCampaigns.dataSource = self.dataSource
        tblSentCampaigns.delegate = self
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
}
