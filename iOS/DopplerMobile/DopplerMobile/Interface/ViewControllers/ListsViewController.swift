//
//  ListsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate, DataSourcePaginationDelegate
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
        self.dataSource = GenericArrayDataSource<ListsTableViewCell, ListDetailViewModel>(items: self.items, cellReuseIdentifier: ListsTableViewCell.identifier, paginationDelegate: self)
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
        self.dataSource?.currentPage = 1
        self.listViewModel.downloadData(page: (self.dataSource?.currentPage)!)
    }
    
    func getNextPage(_ page: Int)
    {
        self.tblLists.activityIndicatorView.startAnimating()
        self.listViewModel.downloadData(page: page)
    }
    
    func updateContent(_ content: AnyObject)
    {
        if ((self.dataSource?.currentPage)! == 1)
        {
            self.dataSource?.items = content as! [ListDetailViewModel]
            refreshControl.endRefreshing()
        }
        else
        {
            self.dataSource?.items.append(contentsOf: content as! [ListDetailViewModel])
        }
        self.tblLists.reloadData()
        if(self.tblLists.activityIndicatorView.isAnimating)
        {
            self.tblLists.activityIndicatorView.stopAnimating()
        }
    }
}
