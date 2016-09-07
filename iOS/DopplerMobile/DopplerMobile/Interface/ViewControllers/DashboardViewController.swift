//
//  DashboardViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 1/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate
{
    // MARK: Properties
    var dashboardViewModel: DashboardViewModel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.setNavigationBarHidden(false, animated: false)
    }
}