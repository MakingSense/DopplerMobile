//
//  DataSourceContentDelegate.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 13/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

protocol DataSourceContentDelegate: class
{
    //TODO: Research about using generics on this protocol definition so we have more control of types being used and compilation-time checks. Something like DataSourceContentDelegate<T>
    func updateContent(_ content: AnyObject)
    func handleRefresh(_ refreshControl: UIRefreshControl)
}
