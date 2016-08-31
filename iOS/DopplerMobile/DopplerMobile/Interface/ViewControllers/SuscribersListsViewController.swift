//
//  SuscribersListsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SuscribersListsViewController: UIViewController, UITableViewDelegate
{    
    // MARK: Properties
    @IBOutlet private weak var tblSuscribersLists: UITableView!
    var dataSource : SuscribersListsViewDataSource?
    var listViewModel: ListViewModel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listViewModel = ListViewModel(suscribersService: SuscribersService())
        self.tblSuscribersLists.delegate = self
        //TODO: remove this when reactive is implemented.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SuscribersListsViewController.OnNotificationArrived(_:)), name:NotificationIdentifier.SuscribersListsNotification.rawValue, object: nil)
    }
    
    //TODO: Check the best place to receive this notification.
    @objc func OnNotificationArrived(notification: NSNotification){
        if(notification.object != nil)
        {
            var suscribersLists = [SuscribersListViewModel]()
            let lists = notification.object as! [List]
            for list in lists {
                suscribersLists.append(SuscribersListViewModel(list: list))
            }
            self.dataSource = SuscribersListsViewDataSource(viewModel: listViewModel, suscribersLists: suscribersLists)
            self.tblSuscribersLists.dataSource = self.dataSource
        }
        else
        {
            //TODO: Show error.
        }
    }
    
    //TODO: remove this when reactive is implemented.
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}