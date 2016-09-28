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
    fileprivate var models : [OnboardingContentViewModel]
    fileprivate var views : [UIViewController]
    fileprivate var currentIndex : Int = 0
    fileprivate var pager : UIPageViewController
    
    init(pager : UIPageViewController)
    {
        self.pager = pager
        self.models = [OnboardingContentViewModel(title: "ONBOARDING_ONE_TITLE".localized, subtitle: "ONBOARDING_ONE_SUBTITLE".localized, imageName: "Onboarding-1"),
                       OnboardingContentViewModel(title: "ONBOARDING_TWO_TITLE".localized, subtitle: "ONBOARDING_TWO_SUBTITLE".localized, imageName: "Onboarding-2"),
                       OnboardingContentViewModel(title: "ONBOARDING_THREE_TITLE".localized, subtitle: "ONBOARDING_THREE_SUBTITLE".localized, imageName: "Onboarding-3")]
        
        self.views = []
    }
    
    func initialViewController() -> UIViewController
    {
        return getViewControllerFromViewModel(self.models[0])
    }
    
    // MARK: UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        self.currentIndex = views.index(of: viewController)!
        return currentIndex == 0 ? nil : getViewControllerFromViewModel(self.models[currentIndex - 1])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        self.currentIndex = views.index(of: viewController)!
        return currentIndex == self.models.count - 1 ? nil : getViewControllerFromViewModel(self.models[currentIndex + 1])
    }
    
    // MARK: OnboardingContentViewControllerDelegate
    func nextTouched()
    {
        if let next = pageViewController(pager,viewControllerAfter: self.views[currentIndex])
        {
            self.pager.setViewControllers([next], direction: .forward, animated: true, completion: nil)
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
    func showViewModel(_ identifier: String)
    {
        self.pager.performSegue(withIdentifier: SegueIdentifier.DashboardScreenSegue, sender : self)
    }
    
    fileprivate func getViewControllerFromViewModel(_ viewModel: OnboardingContentViewModel) -> UIViewController
    {
        //TODO: Change content here for something more meaningful
        let result = views.filter { ($0 as! OnboardingContentViewController).viewModel?.title == viewModel.title }
        if result.first != nil
        {
            return result.first!
        }
        
        let viewController:OnboardingContentViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: OnboardingContentViewController.identifier) as! OnboardingContentViewController
        viewController.viewModel = viewModel
        viewController.delegate = self
        views.append(viewController)
        
        return viewController
    }
}
