//
//  AddSubscriberTableViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 11/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class AddSubscriberTableViewController: UITableViewController
{
    var fields: [SubscriberFieldViewModel]?
    var subscriberItem: AddSubscriberMockUpViewModel?
    var dataSource: AddSubscriberTableViewDataSource?

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        subscriberItem = AddSubscriberMockUpViewModel()
        
        dataSource = AddSubscriberTableViewDataSource(sections: subscriberItem?.sections)
        tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        setupNavigationItems()
    }
    
    func setupNavigationItems()
    {
        var leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddSubscriberTableViewController.cancel(button:)))
        leftButton.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "ProximaNova-SemiBold", size: 14)!,
            NSForegroundColorAttributeName : UIColor.green()],
                                          for: UIControlState.normal)
        
        var rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddSubscriberTableViewController.done(button:)))
        rightButton.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "ProximaNova-SemiBold", size: 14)!,
            NSForegroundColorAttributeName : UIColor.green()],
                                          for: UIControlState.normal)
        
        //Navigation Items
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
        
        self.title = "Add New Subscriber"
    }
    
    func cancel(button: UIButton)
    {
        //TODO: Navite back.
        print("Navigation: Cancel button touched.")
    }
    
    func done(button: UIButton)
    {
        //TODO: Validate then Submit.
        print("Navigation: Done button touched.")
    }
}
