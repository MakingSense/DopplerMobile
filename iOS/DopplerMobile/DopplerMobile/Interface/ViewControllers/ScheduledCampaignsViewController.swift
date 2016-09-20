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
    @IBOutlet private weak var tblScheduledCampaigns: UITableView!
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
        self.scheduledCampaignViewModel = ScheduledCampaignViewModel(campaignsService: CampaignsService(), contentDelegate: self)
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let selectedCellIndex = self.tblScheduledCampaigns.indexPathForSelectedRow
        {
            let campaignItem = self.dataSource!.items[selectedCellIndex.row]
            let basicInformationViewController = segue.destinationViewController as! BasicInformationViewController
            basicInformationViewController.campaignItem = campaignItem
        }
    }
    
    func updateContent(content: AnyObject) {
        dataSource?.items = content as! [CampaignViewModel]
        tblScheduledCampaigns.reloadData()
    }
}
