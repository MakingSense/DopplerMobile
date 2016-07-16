//
//  MSRequestData.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

typealias MSRequestServiceCallback = (success:Bool, error:NSError?) -> Void

class MSRequestData
{
    private(set) var callback: MSRequestServiceCallback
    private(set) var method: Int
    private(set) var parameters: Dictionary<String, AnyObject>

    init(method: Int, parameters: Dictionary<String, AnyObject>, callback: MSRequestServiceCallback)
    {
        self.method = method
        self.parameters = parameters
        self.callback = callback
    }
}