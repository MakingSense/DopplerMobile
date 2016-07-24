//
//  NavigationHandler.swift
//  DopplerMobile
//
//  Created by Marcelo Vazquez on 7/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import UIKit

class NavigationHandler : NSObject, NavigationDelegate
{
    private var appDelegate : AppDelegate
    
    dynamic init(appDelegate : AppDelegate)
    {
        self.appDelegate = appDelegate
    }
    
    dynamic func showViewModel(identifier: String)
    {
        self.appDelegate.window?.rootViewController!.performSegueWithIdentifier(identifier, sender: self)
    }
}
