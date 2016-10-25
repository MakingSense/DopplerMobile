//
//  ListsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate
{
    // MARK: Properties
    @IBOutlet fileprivate weak var tblLists: UITableView!
    var dataSource : GenericArrayDataSource<ListsTableViewCell, ListDetailViewModel>?
    var listViewModel: ListViewModel!
    var items: [ListDetailViewModel] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(SentCampaignsViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblLists.addSubview(self.refreshControl)
        self.listViewModel = ListViewModel(suscribersService: SuscribersService(), contentDelegate: self)
        self.tblLists.delegate = self
        self.dataSource = GenericArrayDataSource<ListsTableViewCell, ListDetailViewModel>(items: self.items, cellReuseIdentifier: ListsTableViewCell.identifier)
        self.tblLists.dataSource = self.dataSource
        self.tblLists.backgroundView = self.tblLists.activityIndicatorView
        self.tblLists.activityIndicatorView.startAnimating()
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let selectedCellIndex = self.tblLists.indexPathForSelectedRow
        {
            let subscribersList = self.dataSource!.items[(selectedCellIndex as NSIndexPath).row]
            let subscribersViewController = segue.destination as! SubscribersViewController
            subscribersViewController.listItem = subscribersList
        }
    }
    
    
    func handleRefresh(_ refreshControl: UIRefreshControl)
    {
        self.listViewModel.refreshList()
    }
    
    func updateContent(_ content: AnyObject) {
        dataSource?.items = content as! [ListDetailViewModel]
        tblLists.reloadData()
        refreshControl.endRefreshing()
        if(self.tblLists.activityIndicatorView.isAnimating)
        {
            self.tblLists.activityIndicatorView.stopAnimating()
        }
    }
}
