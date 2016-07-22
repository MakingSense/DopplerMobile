//
//  OnboardingViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 6/23/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController
{
    private var onboardingDataSource : OnboardingViewDataSource?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.onboardingDataSource = OnboardingViewDataSource(pager: self)
        self.dataSource = self.onboardingDataSource
        setViewControllers([self.onboardingDataSource!.initialViewController()], direction: .Forward, animated: true, completion: nil)
    }
}
