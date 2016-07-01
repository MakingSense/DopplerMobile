//
//  OnboardingViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 6/23/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource, OnboardingContentViewControllerDelegate
{
    var viewModel : OnboardingViewModel?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        dataSource = self

        setupContent()
    }

    // MARK: UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let viewModel = previous()
        return viewModel != nil ? createViewControllerFromViewModel(viewModel!) : nil
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let viewModel = next()
        return viewModel != nil ? createViewControllerFromViewModel(viewModel!) : nil
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.viewModel!.pages.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.viewModel!.currentIndex
    }

    func presentViewControllerFromViewModel(viewController: UIViewController)
    {
        self.setViewControllers([viewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
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

        let firstViewModel = self.viewModel!.setupOnboardingContent()

        presentViewControllerFromViewModel(createViewControllerFromViewModel(firstViewModel!))
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

            presentViewControllerFromViewModel(viewController)
        }
    }

    func skipTouched()
    {
        //TODO: Add later logic to skip the onboarding process.
    }
    
}
