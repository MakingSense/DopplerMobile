//
//  MSMainProcessor.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

//MARK: - Alias
typealias ProcessorCallback = (success: Bool, error: NSError?) -> Void

//MARK: - Class
class MSMainProcessor
{
    private let configuration: MSRestConfiguration
    private let restClientManager: MSRestClientManager
    
    init(configuration: MSRestConfiguration, restManager: MSRestClientManager)
    {
        self.configuration = configuration
        self.restClientManager = restManager
    }
    
    func queueRequest(requestConfiguration: MSRequestConfiguration,
                      parameters: Dictionary<String, AnyObject>, headers: Dictionary<String,String>, callback: ProcessorCallback, methodRequestId: Int, requestId: String)
    {
        let req = requestConfiguration.getRequest(parameters, headers: headers,
                                                  successCallback: self.getResponseCallback(requestConfiguration, callback: callback, methodRequestId: methodRequestId),
                                                  errorCallback: self.getErrorListener(callback))
        //TODO: add retry to Request class
        self.restClientManager.addToRequestQueue(req)
    }
    
    private func getErrorListener(callback: ProcessorCallback) -> ErrorRequestCallback
    {
        return {
            (error: NSError, response: MSResponseMessage) in
            //TODO: Print error information
            callback(success: false, error: error)
        }
    }
    
    private func getResponseCallback(requestConfiguration: MSRequestConfiguration, callback: ProcessorCallback, methodRequestId: Int) -> SuccessRequestCallback
    {
        return {
            (response: AnyObject, requestOperation: MSResponseMessage) in
            let processor = requestConfiguration.getProcessor()
            processor.handleResponse(response)
            callback(success: true, error: nil)
        }
    }
}
