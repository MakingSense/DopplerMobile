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
    @IBOutlet private weak var tblLists: UITableView!
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let selectedCellIndex = self.tblLists.indexPathForSelectedRow
        {
            let suscribersList = self.dataSource!.items[selectedCellIndex.row]
            let suscribersViewController = segue.destinationViewController as! SuscribersViewController
            suscribersViewController.listItem = suscribersList
        }
    }
    
    func updateContent(content: AnyObject) {
        dataSource?.items = content as! [ListDetailViewModel]
        tblLists.reloadData()
    }
}