//
//  MSRequestService.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class MSRequestService
{
    
    static let RequestServiceNotificationKey = "kServiceNotification"
    private var mainProcessor: MSMainProcessor!
    private var restConfiguration: MSRestConfiguration!
    
    init()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleNotification:", name: MSRequestService.RequestServiceNotificationKey, object: nil)
        var restManager: MSRestClientManager
        do {
            restManager = try MSRestClientManager.getInstance()
            self.restConfiguration = restManager.getConfiguration()
            self.mainProcessor = MSMainProcessor(configuration: restConfiguration!, restManager: restManager)
        }
        catch
        {
            preconditionFailure("Failed to initialize RequestService")
        }
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @objc func handleNotification(notification: NSNotification)
    {
        
        let reqServiceInfo = notification.object as? MSRequestData
        if (reqServiceInfo == nil)
        {
            return
        }
        let callback = reqServiceInfo!.callback
        let methodId = reqServiceInfo!.method
        let parameters = reqServiceInfo!.parameters
        let requestId = generateRequestId()
        
        self.mainProcessor!.queueRequest(restConfiguration.getRequestConfiguration(methodId), parameters: parameters, callback: makeProcessorCallback(callback), methodRequestId: methodId, requestId: requestId)
    }
    
    private func makeProcessorCallback(callback: MSRequestServiceCallback) -> ProcessorCallback
    {
        return {
            (success: Bool, error: NSError?) in
            //Add code here if you need do something
            callback(success: success, error: error)
        }
    }
    
    /// this method generate a random GUID
    private func generateRequestId() -> String
    {
        return NSUUID().UUIDString
    }
}

