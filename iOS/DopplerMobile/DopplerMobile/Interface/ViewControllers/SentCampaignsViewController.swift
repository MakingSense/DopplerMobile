//
//  DashboardViewController.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/18/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SentCampaignsViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate
{
    // MARK: Properties
    @IBOutlet fileprivate weak var tblSentCampaigns: UITableView!
    var dataSource : SentCampaignsViewDataSource?
    var sentCampaignViewModel: SentCampaignViewModel!
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tblSentCampaigns.delegate = self
        self.sentCampaignViewModel = SentCampaignViewModel(campaignsService: CampaignsService(), contentDelegate: self)
        self.dataSource = SentCampaignsViewDataSource()
        self.tblSentCampaigns.dataSource = self.dataSource
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let selectedCellIndex = self.tblSentCampaigns.indexPathForSelectedRow
        {
            let campaignItem = self.dataSource!.items[(selectedCellIndex as NSIndexPath).row]
            let reportViewController = segue.destination as! ReportSegmentViewController
            reportViewController.campaignItem = campaignItem
        }
    }
    
    func updateContent(_ content: AnyObject)
    {
        dataSource?.items = content as! [CampaignViewModel]
        tblSentCampaigns.reloadData()
    }
}
