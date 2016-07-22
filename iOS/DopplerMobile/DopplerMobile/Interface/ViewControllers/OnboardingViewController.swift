//
//  OnboardingViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 6/23/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, OnboardingContentViewControllerDelegate, NavigationDelegate
{
    var viewModel : OnboardingViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let directions: [UISwipeGestureRecognizerDirection] = [.Left, .Right]
        for direction in directions
        {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.handleSwipes(_:)))
            gesture.direction = direction
            view.addGestureRecognizer(gesture)
        }
        setupViewModel()
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer)
    {
        var direction : UIPageViewControllerNavigationDirection?
        var viewModel : OnboardingContentViewModel?
        
        switch sender.direction
        {
            case UISwipeGestureRecognizerDirection.Right:
                viewModel = self.viewModel!.previous()
                direction = UIPageViewControllerNavigationDirection.Reverse
            case UISwipeGestureRecognizerDirection.Left:
                viewModel = self.viewModel!.next()
                direction = UIPageViewControllerNavigationDirection.Forward
            default: () //Do nothing!
        }
        
        if(viewModel != nil)
        {
            presentViewControllerFromViewModel(createViewControllerFromViewModel(viewModel!), direction: direction!)
        }
    }
    
    func presentViewControllerFromViewModel(viewController: UIViewController, direction: UIPageViewControllerNavigationDirection)
    {
        self.setViewControllers([viewController], direction: direction, animated: true, completion: nil)
    }
    
    func createViewControllerFromViewModel(viewModel: OnboardingContentViewModel) -> UIViewController
    {
        let viewController:OnboardingContentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OnboardingContentViewController") as! OnboardingContentViewController
        viewController.viewModel = viewModel
        viewController.delegate = self
        return viewController
    }
    
    func setupViewModel()
    {
        self.viewModel = OnboardingViewModel(navigationDelegate: self)
        let firstViewModel = self.viewModel?.pages[(self.viewModel?.currentIndex)!]
        presentViewControllerFromViewModel(createViewControllerFromViewModel(firstViewModel!), direction: UIPageViewControllerNavigationDirection.Forward)
    }
    
    // MARK: OnboardingContentViewControllerDelegate
    func nextTouched()
    {
        let viewModel = self.viewModel?.next()
        if(viewModel != nil)
        {
            let viewController = createViewControllerFromViewModel(viewModel!)
            presentViewControllerFromViewModel(viewController, direction: UIPageViewControllerNavigationDirection.Forward)
        }
    }
    
    func skipTouched()
    {
        self.viewModel?.skip()
    }
    
    //TODO: implement a generic way to navigate between view model
    func showViewModel(identifier: SegueIdentifier)
    {
        performSegueWithIdentifier(identifier.rawValue, sender: self)
    }
}
