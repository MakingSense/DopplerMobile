//
//  MSRequestProtocol.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Alamofire

protocol MSRequestProtocol
{
    func getHTTPMethod() -> Alamofire.Method
    func getMethodRequestId() -> Int
    func getParameterEncoding() -> Alamofire.ParameterEncoding
    func getRelativePath() -> String
    func getParams() -> [String: AnyObject]?
    func getHeaders() -> [String: String]?
    func getSuccessCallback(response: AnyObject!) //-> ((Alamofire.Manager!, AnyObject!) -> Void)
    func getErrorCallback(error: NSError!) //-> ((Alamofire.Manager!, NSError!) -> Void)
    static func Create(parameters: Dictionary<String, AnyObject>, headers: Dictionary<String, String>,  successCallback: SuccessRequestCallback, errorCallback: ErrorRequestCallback) -> MSRequestProtocol
}