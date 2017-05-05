//
//  OnboardingViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 6/23/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import SwiftyOnboard

class OnboardingViewController: UIViewController {
    
    private var dataSource: OnboardingViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftyOnboard = SwiftyOnboard(frame: view.frame)
        view.addSubview(swiftyOnboard)
        
        dataSource = OnboardingViewDataSource(self)
        swiftyOnboard.dataSource = dataSource
    }
}
