//
//  DataSourcePaginationDelegate.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 25/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
import UIKit

protocol DataSourcePaginationDelegate: class
{
    func getNextPage(_ pageId: Int)
}
