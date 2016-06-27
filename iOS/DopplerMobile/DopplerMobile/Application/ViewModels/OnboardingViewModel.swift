//
//  OnboardingViewModel.swift
//  DopplerMobile
//
//  Created by Mugu on 6/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

protocol OnboardingViewModelDelegate: class
{
    func setupOnboardingContent()

    func next() -> String

    func skip()
}

public class OnboardingViewModel
{
    //As content is an array of strings I tried to use a plural name but "contents" just plain sucks. I left content.
    var content : [String] = []
    var currentIndex : Int = 0

    weak var delegate: OnboardingViewModelDelegate?

    func setupOnboardingContent()
    {
        //TODO: Get actual content from a localization solution.
        self.content = ["One", "Two", "Three"];
    }

    func next() -> String
    {
        self.currentIndex += 1
        let contentToReturn = self.content[self.currentIndex]

        return contentToReturn
    }

    func skip()
    {
        //What is this supposed to return? [Mugu]
    }


}
