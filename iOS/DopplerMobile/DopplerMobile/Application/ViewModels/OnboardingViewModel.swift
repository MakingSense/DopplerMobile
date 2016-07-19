//
//  OnboardingViewModel.swift
//  DopplerMobile
//
//  Created by Mugu on 6/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class OnboardingViewModel
{
    var pages : [OnboardingContentViewModel] = []
    var currentIndex : Int = 0
    
    init()
    {
        //TODO: Get actual content from a localization solution.
        addTestContent()
        self.currentIndex = 0
    }
    
    func next() -> OnboardingContentViewModel?
    {
        if(pages.count - 1 <= self.currentIndex)
        {
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
        //TODO: Check back later when we decide if the VM or the VC are gonna take care of the app navigation.
    }
    
    //TODO: Remove this later, only for testing.
    private func addTestContent()
    {
        let arrayOfStrings : [String] = ["One", "Two", "Three"];
        
        for string in arrayOfStrings
        {
            let newContent = OnboardingContentViewModel(content: string)
            self.pages.append(newContent)
        }
    }
}