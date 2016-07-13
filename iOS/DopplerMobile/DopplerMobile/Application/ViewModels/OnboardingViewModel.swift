//
//  OnboardingViewModel.swift
//  DopplerMobile
//
//  Created by Mugu on 6/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class OnboardingViewModel
{
    let pagesList = LinkedList<OnboardingContentViewModel>()
    var currentViewModel : OnboardingContentViewModel?
    var currentNode : LinkedListNode<OnboardingContentViewModel>?

    func setupOnboardingContent()
    {
        //TODO: Get actual content from a localization solution.
        addTestContent()
    }

    //TODO: Work a solution to not increment the index or repeat values when not necessary.
    func next() -> OnboardingContentViewModel?
    {
        if((self.currentNode?.next) != nil)
        {
            self.currentViewModel = self.currentNode?.next?.value
            self.currentNode = self.currentNode?.next

            return self.currentViewModel
        }
        else
        {
            return nil
        }
    }

    func previous() -> OnboardingContentViewModel?
    {
        if((self.currentNode?.previous) != nil)
        {
            self.currentViewModel = self.currentNode?.previous?.value
            self.currentNode = self.currentNode?.previous

            return self.currentViewModel
        }
        else
        {
            return nil
        }
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
            self.pagesList.append(newContent)
        }

        self.currentNode = self.pagesList.first
        self.currentViewModel = self.currentNode?.value
    }
}
