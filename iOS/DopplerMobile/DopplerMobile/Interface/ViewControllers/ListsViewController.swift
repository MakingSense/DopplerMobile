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
    var dataSource : ListsViewDataSource?
    var listViewModel: ListViewModel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listViewModel = ListViewModel(suscribersService: SuscribersService(), contentDelegate: self)
        self.tblLists.delegate = self
        self.dataSource = ListsViewDataSource()
        self.tblLists.dataSource = self.dataSource
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
    
    func updateContent(_ content: AnyObject) {
        dataSource?.items = content as! [ListDetailViewModel]
        tblLists.reloadData()
    }
}
