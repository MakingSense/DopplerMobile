//
//  MSRestClientManager.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import AFNetworking

class MSRestClientManager
{
  
  private let configuration: MSRestConfiguration
  private static var instance: MSRestClientManager!
  private var httpClient: AFHTTPClient!
  
  init(configuration: MSRestConfiguration)
  {
    self.configuration = configuration
    self.httpClient = AFHTTPClient(baseURL: NSURL(string: configuration.getBaseUrl()))
    self.httpClient.setDefaultHeader("Accept", value: "application/json")
    self.httpClient.parameterEncoding = AFJSONParameterEncoding
  }
  
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
  
  func getConfiguration() -> MSRestConfiguration
  {
    return configuration
  }
  
  func addToRequestQueue(req: MSRequestProtocol)
  {
    self.httpClient.parameterEncoding = req.getParameterEncoding()
    let request = self.httpClient.requestWithMethod(req.getHTTPMethod(), path: req.getRelativePath(), parameters: req.GetParams())
    let operation = self.httpClient.HTTPRequestOperationWithRequest(request, success: req.getSuccessCallback(),
      failure: req.getErrorCallback())
    self.httpClient.operationQueue.addOperation(operation)
  }
}
