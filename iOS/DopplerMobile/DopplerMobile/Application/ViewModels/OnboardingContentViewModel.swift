//
//  OnboardingContentViewModel.swift
//  DopplerMobile
//
//  Created by Trick Dev on 6/28/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Bond

class OnboardingContentViewModel {
    
    let title = Observable<String>("")
    let subtitle = Observable<String>("")
    let imageName = Observable<String>("")
    
    init(title: String, subtitle: String, imageName: String) {
        self.title.value = title
        self.subtitle.value = subtitle
        self.imageName.value = imageName
    }
}
