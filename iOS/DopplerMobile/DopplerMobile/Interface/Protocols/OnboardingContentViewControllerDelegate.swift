//
//  File.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 21/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

protocol OnboardingContentViewControllerDelegate: class
{
    func nextTouched()
    func skipTouched()
}
