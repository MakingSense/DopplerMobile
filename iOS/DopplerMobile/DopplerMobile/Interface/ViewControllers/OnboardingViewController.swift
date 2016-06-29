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
    //var currentContentViewController: OnboardingContentViewController?
    var arrayOfContent: [OnboardingContentViewController] = [OnboardingContentViewController]()
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
        /*let pageContent: OnboardingContentViewController = viewController as! OnboardingContentViewController

        var index = pageContent.index

        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }

        index -= 1;

        return getViewControllerAtIndex(index)*/

        let vc = previous(viewController)

        if(vc != nil)
        {
            return vc
        }
        else
        {
            return getViewControllerAtIndex((self.viewModel?.currentIndex)!)
        }
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        return next(viewController)
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return (self.viewModel?.content.count)!
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }


    // MARK: Other Methods
    func getViewControllerAtIndex(index: Int) -> OnboardingContentViewController
    {
        return createViewControllerFromViewModel((self.viewModel?.content[index])!)
    }

    func createViewControllerFromViewModel(viewModel: OnboardingContentViewModel) -> OnboardingContentViewController
    {
        let vc = OnboardingContentViewController(viewModel: viewModel, nibName: "OnboardingContentViewController")
        //vc.setupView(viewModel)
        return vc
    }

//    func setupContent()
//    {
//        //Add all the VCs
//        for index in 0...2
//        {
//            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("OnboardingContentViewController") as? OnboardingContentViewController
//            vc?.setupView("\(titles[index])", index: index)
//            vc?.delegate = self
//            self.arrayOfContent.append(vc!)
//        }
//
//        //setViewControllers need an array with just one element, so we prepare one.
//        var array = [arrayOfContent[0]]
//
//        //set the current vc for later.
//        self.currentContentViewController = arrayOfContent[0] as OnboardingContentViewController
//
//        self.setViewControllers(array, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
//    }

    func setupContent()
    {
        self.viewModel = OnboardingViewModel()

        self.viewModel!.setupOnboardingContent()

        let vc = getViewControllerAtIndex(0) as UIViewController

        var array : [UIViewController] = []

        array.append(vc)

        self.setViewControllers(array, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }

    //This should probably be removed later with VM
    func next(viewController: UIViewController) -> UIViewController?
    {
        /*let content: OnboardingContentViewController = viewController as! OnboardingContentViewController

        var index = content.index*/

        var result : UIViewController?

        var index = self.viewModel?.currentIndex

        if(index != NSNotFound)
        {
            index! += 1
            if(index < (self.viewModel?.content.count)!)
            {
                result = getViewControllerAtIndex(index!)
                self.viewModel?.currentIndex = index!
            }
            else
            {
                result = nil
            }
        }

        return result
    }

    func previous(viewController: UIViewController) -> UIViewController?
    {
        var result : UIViewController?

        var index = self.viewModel?.currentIndex

        if(index != NSNotFound)
        {
            index! -= 1
            if(index >= 0)
            {
                result = getViewControllerAtIndex(index!)
                self.viewModel?.currentIndex = index!
            }
            else
            {
                result = nil
            }
        }

        return result
    }

    // MARK: OnboardingContentViewControllerDelegate
    func nextTouched()
    {
        let nextVC = next(getViewControllerAtIndex((self.viewModel?.currentIndex)!))

        //If there's a next controller, present it.
        if(nextVC != nil)
        {
            //setViewControllers need an array with just one element, so we prepare one.
            var array = [UIViewController]()

            array.append(nextVC!)

            self.setViewControllers(array, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        }
        //else: do nothing!
    }

    func skipTouched()
    {
        //TODO: Add later logic to skip the onboarding process.
    }
    
}
