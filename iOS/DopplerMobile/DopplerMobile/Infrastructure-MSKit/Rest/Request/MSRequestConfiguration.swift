//
//  MSRequestConfiguration.swift
//  MSRestKitProj
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

class MSRequestConfiguration
{
    let requestId : Int
    let entityClass : MSEntityBase.Type
    let processorClass : MSProcessorBase.Type
    let requestClass : MSRequestProtocol.Type
    
    init(reqId: Int, entityClass: MSEntityBase.Type, processorClass: MSProcessorBase.Type, requestClass: MSRequestProtocol.Type)
    {
        self.requestId = reqId
        self.entityClass = entityClass
        self.processorClass = processorClass
        self.requestClass = requestClass
    }

    func getRequest(parameters: Dictionary<String, AnyObject>, headers: Dictionary<String, String>,  successCallback: SuccessRequestCallback, errorCallback: ErrorRequestCallback) -> MSRequestProtocol
    {
        return self.requestClass.Create(parameters, headers: headers, successCallback: successCallback, errorCallback: errorCallback)
    }
    
    func getProcessor() -> MSProcessorBase
    {
        return self.processorClass.Create()
    }
}