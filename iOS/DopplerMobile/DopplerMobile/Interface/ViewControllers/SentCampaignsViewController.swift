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
    @IBOutlet private weak var tblSentCampaigns: UITableView!
    var dataSource : SentCampaignsViewDataSource<CampaignViewModel>?
    var sentCampaignViewModel: SentCampaignViewModel!
    var items: [CampaignViewModel] = []
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.tblSentCampaigns.delegate = self
        self.sentCampaignViewModel = SentCampaignViewModel(campaignsService: CampaignsService(), contentDelegate: self)
        self.dataSource = SentCampaignsViewDataSource<CampaignViewModel>(cellReuseIdentifier: SentCampaignsTableViewCell.identifier)
        self.tblSentCampaigns.dataSource = self.dataSource
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
    
    func updateContent(content: AnyObject) {
        dataSource?.items = content as! [CampaignViewModel]
        tblSentCampaigns.reloadData()
    }
}
