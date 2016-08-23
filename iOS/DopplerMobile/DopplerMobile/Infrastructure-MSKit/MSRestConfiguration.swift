//
//  MSRestConfiguration.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class MSRestConfiguration
{
    private var requestConfigurationList: [MSRequestConfiguration]
    private var baseURL: String!
    
    init(requestConfigurationList: [MSRequestConfiguration], baseURL: String)
    {
        self.requestConfigurationList = requestConfigurationList
        self.baseURL = baseURL
    }
    
    func getBaseUrl() -> String
    {
        return baseURL
    }
    
    func getRequestConfiguration(restMethodId: Int) -> MSRequestConfiguration
    {
        return self.requestConfigurationList.filter({ $0.requestId == restMethodId }).first!
    }
}