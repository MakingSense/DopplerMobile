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

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.handleSwipes(_:)))

        leftSwipe.direction = .Left
        rightSwipe.direction = .Right

        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)

        setupContent()
    }

    func handleSwipes(sender:UISwipeGestureRecognizer)
    {
        if (sender.direction.rawValue == 1)
        {
            let viewModel = previous()
            if(viewModel != nil)
            {
                presentViewControllerFromViewModel(createViewControllerFromViewModel(viewModel!), direction: UIPageViewControllerNavigationDirection.Reverse)
            }
        }
        else if (sender.direction.rawValue == 2)
        {
            let viewModel = next()
            if(viewModel != nil)
            {
                presentViewControllerFromViewModel(createViewControllerFromViewModel(viewModel!), direction: UIPageViewControllerNavigationDirection.Forward)
            }
        }
    }

    func presentViewControllerFromViewModel(viewController: UIViewController, direction: UIPageViewControllerNavigationDirection)
    {
        self.setViewControllers([viewController], direction: direction, animated: true, completion: nil)
    }

    func createViewControllerFromViewModel(viewModel: OnboardingContentViewModel) -> UIViewController
    {
        let viewController:OnboardingContentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OnboardingContentViewController") as! OnboardingContentViewController

        viewController.setupViewModel(viewModel)

        viewController.delegate = self
        
        return viewController
    }


    func setupContent()
    {
        self.viewModel = OnboardingViewModel()

        self.viewModel!.setupOnboardingContent()

        let firstViewModel = self.viewModel?.currentViewModel

        presentViewControllerFromViewModel(createViewControllerFromViewModel(firstViewModel!), direction: UIPageViewControllerNavigationDirection.Forward)
    }

    //This should probably be removed later with VM
    func next() -> OnboardingContentViewModel?
    {
        return self.viewModel!.next()
    }

    func previous() -> OnboardingContentViewModel?
    {
        return self.viewModel!.previous()
    }

    // MARK: OnboardingContentViewControllerDelegate
    func nextTouched()
    {
        let viewModel = next()
        if(viewModel != nil)
        {
            let viewController = createViewControllerFromViewModel(viewModel!)

            presentViewControllerFromViewModel(viewController, direction: UIPageViewControllerNavigationDirection.Forward)
        }
    }

    func skipTouched()
    {
        //TODO: Add later logic to skip the onboarding process.
    }
    
}
