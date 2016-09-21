//
//  OnboardingContentViewModel.swift
//  DopplerMobile
//
//  Created by Trick Dev on 6/28/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class OnboardingContentViewModel
{
    var title : String = ""
    var subtitle : String = ""
    var imageName : String = ""
    
    init(title: String, subtitle: String, imageName: String)
    {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }
}
