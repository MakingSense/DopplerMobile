//
//  ScheduledCampaignsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/13/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ScheduledCampaignsViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate, DataSourcePaginationDelegate
{    
    // MARK: Properties
    @IBOutlet fileprivate weak var tblScheduledCampaigns: UITableView!
    var dataSource: GenericArrayDataSource<ScheduledCampaignsTableViewCell, CampaignViewModel>?
    var scheduledCampaignViewModel: ScheduledCampaignViewModel!
    var items: [CampaignViewModel] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(SentCampaignsViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblScheduledCampaigns.addSubview(self.refreshControl)
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.tblScheduledCampaigns.delegate = self
        self.scheduledCampaignViewModel = ScheduledCampaignViewModel(campaignsService: CampaignsService(), contentDelegate: self)
        self.dataSource = GenericArrayDataSource<ScheduledCampaignsTableViewCell, CampaignViewModel>(items: self.items, cellReuseIdentifier: ScheduledCampaignsTableViewCell.identifier, paginationDelegate: self)
        self.tblScheduledCampaigns.dataSource = self.dataSource
        self.tblScheduledCampaigns.backgroundView = self.tblScheduledCampaigns.activityIndicatorView
        self.tblScheduledCampaigns.activityIndicatorView.startAnimating()
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
    
    func handleRefresh(_ refreshControl: UIRefreshControl)
    {
        self.dataSource?.currentPage = 1
        self.scheduledCampaignViewModel.downloadData(pageNumber: (self.dataSource?.currentPage)!)
    }
    
    func getNextPage(_ page: Int)
    {
        self.tblScheduledCampaigns.activityIndicatorView.startAnimating()
        self.scheduledCampaignViewModel.downloadData(pageNumber: page)
    }
    
    func updateContent(_ content: AnyObject)
    {
        if ((self.dataSource?.currentPage)! == 1)
        {
            self.dataSource?.items = content as! [CampaignViewModel]
            refreshControl.endRefreshing()
        }
        else
        {
            self.dataSource?.items.append(contentsOf: content as! [CampaignViewModel])
        }
        self.tblScheduledCampaigns.reloadData()
        if(self.tblScheduledCampaigns.activityIndicatorView.isAnimating)
        {
            self.tblScheduledCampaigns.activityIndicatorView.stopAnimating()
        }
    }
}
