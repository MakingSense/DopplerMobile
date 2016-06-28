//
//  MSRequestProtocol.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import AFNetworking

protocol MSRequestProtocol
{
    
    func getHTTPMethod() -> String
    func getMethodRequestId() -> Int
    func getParameterEncoding() -> AFHTTPClientParameterEncoding
    func getRelativePath() -> String
    func GetParams() -> [NSObject: AnyObject]?
    func getSuccessCallback() -> ((AFHTTPRequestOperation!, AnyObject!) -> Void)
    func getErrorCallback() -> ((AFHTTPRequestOperation!, NSError!) -> Void)
    static func Create(parameters: Dictionary<String, AnyObject>, successCallback: SuccessRequestCallback, errorCallback: ErrorRequestCallback) -> MSRequestProtocol
}