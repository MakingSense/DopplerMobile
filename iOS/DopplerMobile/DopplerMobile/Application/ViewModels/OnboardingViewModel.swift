//
//  OnboardingViewModel.swift
//  DopplerMobile
//
//  Created by Mugu on 6/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class OnboardingViewModel: NavigationDelegate
{
    var pages : [OnboardingContentViewModel] = []
    var currentIndex : Int = 0
    private var onboardingDelegate: OnboardingViewController?
    
    init(onboardingDelegate: OnboardingViewController?)
    {
        //TODO: Get actual content from a localization solution.
        addTestContent()
        self.onboardingDelegate = onboardingDelegate
        self.currentIndex = 0
    }
    
    func next() -> OnboardingContentViewModel?
    {
        //TODO: Check the final logic.
        if(pages.count - 1 <= self.currentIndex)
        {
            ShowViewModel("dashboardSegue")
            return nil
        }
        
        self.currentIndex += 1
        return self.pages[self.currentIndex]
    }
    
    func previous() -> OnboardingContentViewModel?
    {
        if(self.currentIndex <= 0)
        {
            return nil
        }
        
        self.currentIndex -= 1
        return self.pages[self.currentIndex]
    }
    
    func skip()
    {
        ShowViewModel("dashboardSegue")
    }
    
    //TODO: Remove this later, only for testing.
    func addTestContent()
    {
        let arrayOfStrings : [String] = ["ONBOARDING_TEST_ONE".localized,
                                         "ONBOARDING_TEST_TWO".localized,
                                         "ONBOARDING_TEST_THREE".localized]
        
        for string in arrayOfStrings
        {
            let newContent = OnboardingContentViewModel(content: string)
            self.pages.append(newContent)
        }
    }
    
    //TODO: implement a generic way to navigate between view model
    func ShowViewModel(identifier: String) {
        onboardingDelegate?.performSegueWithIdentifier(identifier, sender: onboardingDelegate!)
    }
}