//
//  DMLoginRequest.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 6/28/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import AFNetworking

class DMLoginRequest: MSRequestProtocol
{
    private static let relativeUrl = "tokens"
    private static let HTTPMethod = "POST"
    private static let grantType = "password"
    
    private var successCallback: SuccessRequestCallback!
    private var errorCallback: ErrorRequestCallback!
    private var parameters: Dictionary<String, AnyObject>!
    
    func getHTTPMethod() -> String
    {
        return DMLoginRequest.HTTPMethod
    }
    
    func getMethodRequestId() -> Int
    {
        return MSTMethodsRequest.Login.rawValue
    }
    
    func getParameterEncoding() -> AFHTTPClientParameterEncoding
    {
        return AFPropertyListParameterEncoding
    }
    
    func getRelativePath() -> String
    {
        return DMLoginRequest.relativeUrl
    }
    
    func GetParams() -> [NSObject:AnyObject]?
    {
        return [NSObject:AnyObject]()
    }
    
    func getSuccessCallback() -> ((AFHTTPRequestOperation!, AnyObject!) -> Void)
    {
        return {
            (requestOperation: AFHTTPRequestOperation!, response: AnyObject!) in
            //TODO: do something 
            //COMMENT: save the token
            
            let message = MSResponseMessage(code: 200, label: "success")
            self.successCallback(response: response, requestOperation: message)
        }
    }
    
    func getErrorCallback() -> ((AFHTTPRequestOperation!, NSError!) -> Void)
    {
        return {
            (requestOperation: AFHTTPRequestOperation!, error: NSError!) in
            //TODO: do something
            let message = MSResponseMessage(code: error.code, label: error.domain)
            self.errorCallback(error: error, response: message)
        }
    }
    
    static func Create(parameters: Dictionary<String, AnyObject>, successCallback: SuccessRequestCallback, errorCallback: ErrorRequestCallback) -> MSRequestProtocol
    {
        let loginReq = DMLoginRequest()
        loginReq.successCallback = successCallback
        loginReq.errorCallback = errorCallback
        loginReq.parameters = parameters
        loginReq.parameters["grant_type"] = DMLoginRequest.grantType
        return loginReq
    }
}
