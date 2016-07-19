//
//  DashboardViewController.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/18/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate
{
    // MARK: Properties
    
    @IBOutlet weak var tblSentCampaigns: UITableView!
    var dataSource : SentCampaignsViewDataSource?
    
    // MARK: Actions

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = SentCampaignsViewDataSource()
        self.dataSource!.loadTest()
        tblSentCampaigns.dataSource = self.dataSource
        tblSentCampaigns.delegate = self
    }
}
