//
//  MSProcessorBase.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

//import DATAStack
//import Sync
import SwiftyJSON

class MSProcessorBase
{
    func handleResponse(response: AnyObject)
    {
        let json = JSON(data: response as! NSData)
        if let _ = json.array
        {
            self.handleArray(json)
        }
        else
        {
            self.handleObject(json)
        }
    }
    
    private func handleObject(response: JSON)
    {
        let responseData = parseObject(response)
        self.saveObject(responseData)
    }
    
    private func handleArray(response: JSON)
    {
//        let responseObjectArray = parseArray(response)
//        self.saveArrayObject(responseObjectArray)
    }
    
    private func parseArray(jsonArray: JSON) -> [MSEntityBase]
    {
        var entityListToReturn: [MSEntityBase] = []
        for (_, subJson): (String, JSON) in jsonArray
        {
//            entityListToReturn.append(parseObject(subJson))
        }
        return entityListToReturn
    }

//MARK: - Abstract Methods
    
    func saveObject(object: MSEntityBase)
    {
       preconditionFailure("Should be overriden")
    }
    
    func parseObject(json: JSON) -> MSEntityBase
    {
        preconditionFailure("Should be overriden")
    }
    
    class func Create() -> MSProcessorBase
    {
        preconditionFailure("Should be overriden")
    }
    
    func getNotificationKey() -> String
    {
        preconditionFailure("Should be overriden")
    }
    
    func getEntityName() -> String
    {
        preconditionFailure("Should be overriden")
    }
}