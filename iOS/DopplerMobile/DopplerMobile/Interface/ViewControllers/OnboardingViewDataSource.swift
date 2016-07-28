//
//  OnboardingViewDataSource.swift
//  DopplerMobile
//
//  Created by Marcelo Vazquez on 7/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class OnboardingViewDataSource : NSObject, UIPageViewControllerDataSource, OnboardingContentViewControllerDelegate, NavigationDelegate
{
    private var models : [OnboardingContentViewModel]
    private var views : [UIViewController]
    private var currentIndex : Int = 0
    private var pager : UIPageViewController
    
    init(pager : UIPageViewController)
    {
        self.pager = pager
        self.models = [OnboardingContentViewModel(content: "ONBOARDING_TEST_ONE".localized),
                       OnboardingContentViewModel(content: "ONBOARDING_TEST_TWO".localized),
                       OnboardingContentViewModel(content: "ONBOARDING_TEST_THREE".localized)]
        
        self.views = []
    }
    
    func initialViewController() -> UIViewController
    {
        return getViewControllerFromViewModel(self.models[0])
    }
    
    // MARK: UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        self.currentIndex = views.indexOf(viewController)!
        return currentIndex == 0 ? nil : getViewControllerFromViewModel(self.models[currentIndex - 1])
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        self.currentIndex = views.indexOf(viewController)!
        return currentIndex == self.models.count - 1 ? nil : getViewControllerFromViewModel(self.models[currentIndex + 1])
    }
    
    // MARK: OnboardingContentViewControllerDelegate
    func nextTouched()
    {
        if let next = pageViewController(pager,viewControllerAfterViewController: self.views[currentIndex])
        {
            self.pager.setViewControllers([next], direction: .Forward, animated: true, completion: nil)
            self.currentIndex += 1
        }
        else
        {
            showViewModel(SegueIdentifier.DashboardScreenSegue)
        }
    }
    
    func skipTouched()
    {
        showViewModel(SegueIdentifier.DashboardScreenSegue)
    }
    
    //TODO: Is it the best place to call the callbacks? just to be consistent.
    func showViewModel(identifier: SegueIdentifier) {
        self.pager.performSegueWithIdentifier(SegueIdentifier.DashboardScreenSegue.rawValue, sender : self)
    }
    
    private func getViewControllerFromViewModel(viewModel: OnboardingContentViewModel) -> UIViewController
    {
        //TODO: Change content here for something more meaningful
        let result = views.filter { ($0 as! OnboardingContentViewController).viewModel?.content == viewModel.content }
        if result.first != nil
        {
            return result.first!
        }
        
        let viewController:OnboardingContentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(OnboardingContentViewController.identifier) as! OnboardingContentViewController
        viewController.viewModel = viewModel
        viewController.delegate = self
        views.append(viewController)
        return viewController
    }
}