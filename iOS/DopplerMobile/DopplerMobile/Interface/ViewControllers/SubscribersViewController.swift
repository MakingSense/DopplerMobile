//
//  SuscribersViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SubscribersViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate
{
    // MARK: Properties
    @IBOutlet weak var lblListSuscribersCount: UILabel!
    @IBOutlet weak var lblListTitle: UILabel!
    @IBOutlet weak var tblSuscribers: UITableView!
    var dataSource : SubscribersViewDataSource?
    var suscribersListViewModel: SubscribersListViewModel!
    var listItem: ListDetailViewModel?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tblSuscribers.delegate = self
        self.navigationItem.title = "LISTS_TEXT".localized
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.suscribersListViewModel = SubscribersListViewModel(suscribersService: SuscribersService(), contentDelegate: self, listId: (listItem?.listId!)!)
        self.dataSource = SubscribersViewDataSource()
        self.tblSuscribers.dataSource = self.dataSource
        self.lblListTitle.text = listItem?.name
        self.lblListSuscribersCount.text = String((listItem?.subscribersCount)!)
    }
    
    func updateContent(_ content: AnyObject) {
        dataSource?.items = content as! [SubscriberViewModel]
        tblSuscribers.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let selectedCellIndex = self.tblSuscribers.indexPathForSelectedRow
        {
            let subscriber = self.dataSource?.items[(selectedCellIndex as NSIndexPath).row]
            let subcribersInformationViewController = segue.destination as! SubscriberInformationViewController            
            subcribersInformationViewController.item = subscriber
        }
    }
}
