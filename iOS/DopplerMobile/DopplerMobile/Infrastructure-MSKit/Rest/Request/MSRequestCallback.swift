//
//  MSRequestCallback.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

typealias SuccessRequestCallback = (response: AnyObject, requestOperation: MSResponseMessage) -> Void
typealias ErrorRequestCallback = (error: NSError, response: MSResponseMessage) -> Void