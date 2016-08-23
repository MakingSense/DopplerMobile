//
//  DMRestLayerManager.swift
//  MSRestKitProj
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class DMRestLayerManager
{
    static let BaseURL = "https://restapi.fromdoppler.com/"
    init()
    {
        let requestConfigurationList = getRequestConfigurationsList()
        MSRestClientManager.initializeWithConfiguration(MSRestConfiguration( requestConfigurationList: requestConfigurationList, baseURL: DMRestLayerManager.BaseURL))
    }
    
    private func getRequestConfigurationsList() -> [MSRequestConfiguration]
    {
        var requestConfigurationList = [MSRequestConfiguration]()
        let postLogin = MSRequestConfiguration(reqId: MSTMethodsRequest.Login.rawValue , entityClass: DMLogin.self, processorClass: DMLoginPostProcessor.self, requestClass: DMLoginRequest.self)
        requestConfigurationList.append(postLogin)
        return requestConfigurationList
    }
}