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
    private(set) var headers: Dictionary<String, String>

    init(method: Int, parameters: Dictionary<String, AnyObject>, headers: Dictionary<String, String>, callback: MSRequestServiceCallback)
    {
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.callback = callback
    }
}