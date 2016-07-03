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
    var titles: NSArray = NSArray()
    var currentContentViewController: OnboardingContentViewController?
    var arrayOfContent: [OnboardingContentViewController] = [OnboardingContentViewController]()


    override func viewDidLoad()
    {
        super.viewDidLoad()

        //TODO: Add proper content here.
        titles = ["One", "Two", "Three"];

        dataSource = self

        setupContent()
    }

    // MARK: UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: OnboardingContentViewController = viewController as! OnboardingContentViewController

        var index = pageContent.index

        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }

        index -= 1;

        return getViewControllerAtIndex(index)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        next(viewController)

        return self.currentContentViewController
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.titles.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }


    // MARK: Other Methods
    func getViewControllerAtIndex(index: Int) -> OnboardingContentViewController
    {
        return self.arrayOfContent[index] as! OnboardingContentViewController
    }

    func setupContent()
    {
        //Add all the VCs
        for index in 0...2
        {
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("OnboardingContentViewController") as? OnboardingContentViewController
            vc?.setupView("\(titles[index])", index: index)
            vc?.delegate = self
            self.arrayOfContent.append(vc!)
        }

        //setViewControllers need an array with just one element, so we prepare one.
        var array = [arrayOfContent[0]]

        //set the current vc for later.
        self.currentContentViewController = arrayOfContent[0] as OnboardingContentViewController

        self.setViewControllers(array, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }

    //This should probably be removed later with VM
    func next(viewController: UIViewController)
    {
        let content: OnboardingContentViewController = viewController as! OnboardingContentViewController

        var index = content.index
        if(index != NSNotFound)
        {
            index += 1
            if(index < titles.count)
            {
                self.currentContentViewController = getViewControllerAtIndex(index)
            }
        }
    }

    // MARK: OnboardingContentViewControllerDelegate
    func nextTouched()
    {
        next(self.currentContentViewController!)

        //setViewControllers need an array with just one element, so we prepare one.
        var array = [UIViewController]()

        array.append(self.currentContentViewController!)

        self.setViewControllers(array, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }

    func skipTouched()
    {
        //TODO: Add later logic to skip the onboarding process.
    }
    
}
