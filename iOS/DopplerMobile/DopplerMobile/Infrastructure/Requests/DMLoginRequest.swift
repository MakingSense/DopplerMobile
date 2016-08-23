//
//  DMLoginRequest.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 6/28/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

class DMLoginRequest: MSRequestProtocol
{
    private static let relativeUrl = "tokens"
    private static let HTTPMethod = Alamofire.Method.POST
    private static let grantType = "password"
    
    private var successCallback: SuccessRequestCallback!
    private var errorCallback: ErrorRequestCallback!
    private var parameters: Dictionary<String, AnyObject>!
    private var headers: Dictionary<String, String>!
    
    func getHTTPMethod() -> Alamofire.Method
    {
        return DMLoginRequest.HTTPMethod
    }
    
    func getMethodRequestId() -> Int
    {
        return MSTMethodsRequest.Login.rawValue
    }
    
    func getParameterEncoding() -> Alamofire.ParameterEncoding
    {
        return Alamofire.ParameterEncoding.JSON
    }
    
    func getRelativePath() -> String
    {
        return DMLoginRequest.relativeUrl
    }
    
    func getParams() -> [String:AnyObject]?
    {
        return parameters
    }
    
    func getHeaders() -> [String : String]?
    {
        return headers
    }
    
    func getSuccessCallback(response: AnyObject!) //-> ((Alamofire.Manager!, AnyObject!) -> Void)
    {
        //return {
           // (requestOperation: Alamofire.Manager!, response: AnyObject!) in
            //TODO: do something 
            //COMMENT: save the token
            
            let message = MSResponseMessage(code: 200, label: "success")
            self.successCallback(response: response, requestOperation: message)
        //}
    }
    
    func getErrorCallback( error: NSError!) //-> ((Alamofire.Manager!, NSError!) -> Void)
    {
//        return {
//            (requestOperation: Alamofire.Manager!, error: NSError!) in
            //TODO: do something
            let message = MSResponseMessage(code: error.code, label: error.domain)
            self.errorCallback(error: error, response: message)
//        }
    }
    
    static func Create(parameters: Dictionary<String, AnyObject>,headers: Dictionary<String, String>, successCallback: SuccessRequestCallback, errorCallback: ErrorRequestCallback) -> MSRequestProtocol
    {
        let loginReq = DMLoginRequest()
        loginReq.successCallback = successCallback
        loginReq.errorCallback = errorCallback
        loginReq.parameters = parameters
        loginReq.parameters["grant_type"] = DMLoginRequest.grantType
        loginReq.headers = headers
        return loginReq
    }
}
