//
//  OnboardingViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 6/23/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, OnboardingContentViewControllerDelegate
{
    var viewModel : OnboardingViewModel?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let directions: [UISwipeGestureRecognizerDirection] = [.Left, .Right]
        for direction in directions
        {
            //TODO: Replace with #selector(OnboardingViewController.handleSwipes(_:)))
            let gesture = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))//#selector(OnboardingViewController.handleSwipes(_:)))
            gesture.direction = direction
            view.addGestureRecognizer(gesture)
        }

        setupViewModel()
    }

    func handleSwipes(sender:UISwipeGestureRecognizer)
    {
        var direction : UIPageViewControllerNavigationDirection?
        var viewModel : OnboardingContentViewModel?

        switch sender.direction.rawValue
        {
        case 1:
            viewModel = self.viewModel!.previous()
            direction = UIPageViewControllerNavigationDirection.Reverse
        case 2:
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
        self.viewModel = OnboardingViewModel(onboardingDelegate: self)
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
}
