//
//  ScheduledCampaignsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/13/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ScheduledCampaignsViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate
{    
    // MARK: Properties
    @IBOutlet fileprivate weak var tblScheduledCampaigns: UITableView!
    var dataSource : ScheduledCampaignsViewDataSource?
    var scheduledCampaignViewModel: ScheduledCampaignViewModel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.tblScheduledCampaigns.delegate = self
        self.scheduledCampaignViewModel = ScheduledCampaignViewModel(campaignsService: CampaignsService(), contentDelegate: self)
        self.dataSource = ScheduledCampaignsViewDataSource()
        self.tblScheduledCampaigns.dataSource = self.dataSource
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let selectedCellIndex = self.tblScheduledCampaigns.indexPathForSelectedRow
        {
            let campaignItem = self.dataSource!.items[(selectedCellIndex as NSIndexPath).row]
            let scheduledSegmentViewController = segue.destination as! ScheduledCampaignsSegmentViewController
            scheduledSegmentViewController.campaignItem = campaignItem
            scheduledSegmentViewController.scheduledCampaignViewModel = scheduledCampaignViewModel
        }
    }
    
    func updateContent(_ content: AnyObject) {
        dataSource?.items = content as! [CampaignViewModel]
        tblScheduledCampaigns.reloadData()
    }
}
