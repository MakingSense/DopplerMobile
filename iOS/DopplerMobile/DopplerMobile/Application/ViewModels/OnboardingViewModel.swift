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
    //As content is an array of strings I tried to use a plural name but "contents" just plain sucks. I left content.
    var content : [OnboardingContentViewModel] = []
    var currentIndex : Int = 0

    func setupOnboardingContent()
    {
        //TODO: Get actual content from a localization solution.
        addTestContent()

        self.currentIndex = 0
    }

    func next() -> OnboardingContentViewModel?
    {
        var contentToReturn : OnboardingContentViewModel?
        
        if(content.count > self.currentIndex)
        {
            self.currentIndex += 1
            contentToReturn = self.content[self.currentIndex]
            
        }
        //maybe we should handle the else? with an error or something [Mugu]
        
        return contentToReturn
    }

    func skip()
    {
        //TODO: Check back later when we decide if the VM or the VC are gonna take care of the app navigation.
    }

    //TODO: Remove this later, only for testing.
    func addTestContent()
    {
        let arrayOfStrings : [String] = ["One", "Two", "Three"];
        
        for string in arrayOfStrings
        {
            let newContent = OnboardingContentViewModel()
            newContent.setup(string)
            self.content.append(newContent)
        }
    }
}
