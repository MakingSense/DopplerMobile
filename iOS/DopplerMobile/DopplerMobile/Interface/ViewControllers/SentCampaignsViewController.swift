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
    var dataSource : GenericArrayDataSource<SentCampaignsTableViewCell, CampaignViewModel>?
    var sentCampaignViewModel: SentCampaignViewModel!
    var items: [CampaignViewModel] = []
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.tblSentCampaigns.delegate = self
        self.sentCampaignViewModel = SentCampaignViewModel(campaignsService: CampaignsService(), contentDelegate: self)
        self.dataSource = GenericArrayDataSource<SentCampaignsTableViewCell, CampaignViewModel>(items: self.items, cellReuseIdentifier: SentCampaignsTableViewCell.identifier)
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
