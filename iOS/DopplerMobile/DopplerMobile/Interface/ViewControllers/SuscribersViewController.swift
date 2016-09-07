//
//  SuscribersViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SuscribersViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate
{
    // MARK: Properties
    @IBOutlet weak var lblListSuscribersCount: UILabel!
    @IBOutlet weak var lblListTitle: UILabel!
    @IBOutlet weak var tblSuscribers: UITableView!
    var dataSource : SuscribersViewDataSource?
    var suscribersListViewModel: SuscribersListViewModel!
    var listItem: ListDetailViewModel?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tblSuscribers.delegate = self
        self.navigationItem.title = "LISTS_TEXT".localized
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.suscribersListViewModel = SuscribersListViewModel(suscribersService: SuscribersService(), contentDelegate: self, listId: (listItem?.listId!)!)
        self.dataSource = SuscribersViewDataSource()
        self.tblSuscribers.dataSource = self.dataSource
        self.lblListTitle.text = listItem?.name
        self.lblListSuscribersCount.text = String((listItem?.subscribersCount)!)
    }
    
    func updateContent(content: AnyObject) {
        dataSource?.items = content as! [SuscriberViewModel]
        tblSuscribers.reloadData()
    }
}