//
//  NavigationHandler.swift
//  DopplerMobile
//
//  Created by Marcelo Vazquez on 9/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import UIKit

//TODO: [Technical Debt] This class is shit

///Summary:
///   Handles navigation performing segues on TopViewController
class NavigationHandler : NSObject, NavigationDelegate
{
    private var appDelegate : AppDelegate
    
    dynamic init(appDelegate : AppDelegate)
    {
        self.appDelegate = appDelegate
    }
    
    dynamic func showViewModel(_ identifier: String)
    {
        let topVC = (self.appDelegate.window?.rootViewController! as! UINavigationController).topViewController!
        topVC.performSegue(withIdentifier: identifier, sender: self)
    }
}
