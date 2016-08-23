//
//  MSRestClientManager.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

class MSRestClientManager
{
    let configuration: MSRestConfiguration
    //TODO: should be injected on constructor
    private static var instance: MSRestClientManager!
    private var httpClient: Alamofire.Manager!
    
    init(configuration: MSRestConfiguration)
    {
        //TODO: Check the configuration param, because alamofire receive only a 
        self.configuration = configuration
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        httpClient = Alamofire.Manager(configuration: configuration)
    }
    
    //TODO: Remove this and start using IoC with Swinject
    class func getInstance() throws -> MSRestClientManager
    {
        if (instance == nil)
        {
            throw NSError(domain: "You must call RestClientManager.InitializeWithConfiguration before using RestClient classes" , code: 999, userInfo: nil)
        }
        return instance!
    }
    
    class func initializeWithConfiguration(configuration: MSRestConfiguration)
    {
        instance = MSRestClientManager(configuration: configuration)
    }
    
    func addToRequestQueue(req: MSRequestProtocol)
    {
        //TODO: Make OperationQueue and inform the result.
        Alamofire.request(Alamofire.Method.POST, configuration.getBaseUrl() + req.getRelativePath(), parameters: req.getParams(), encoding: req.getParameterEncoding(), headers: req.getHeaders())
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result
                {
                case .Success:
                    print("Validation Successful")
                    //TODO: Call the callback
                    req.getSuccessCallback(response.data)
                    break
                case .Failure(let error):
                    print(error)
                    //TODO:
                    req.getErrorCallback(error)
                    break
                }
        }
        
        //TODO: Remove this lines after call the correct callback.
        // let operation = self.httpClient.HTTPRequestOperationWithRequest(request, success: req.getSuccessCallback(),                                                                  failure: req.getErrorCallback())
        //self.httpClient.operationQueue.addOperation(operation)
    }
}
