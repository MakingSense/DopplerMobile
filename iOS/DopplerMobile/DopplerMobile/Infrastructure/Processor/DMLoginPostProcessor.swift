//
//  DMLoginPostProcessor.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 6/28/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import ObjectMapper
import SwiftyJSON

class DMLoginPostProcessor: MSProcessorBase
{
    
    override class func Create() -> MSProcessorBase
    {
        return DMLoginPostProcessor()
    }
    
    func saveArrayObject(objectArray: [MSEntityBase])
    {
        
        //TODO: this methods not applay to this Model

//        for post in objectArray as! [DPLogin]
//        {
//            DPLogin.createWithEntity(post)
//        }
//        NSNotificationCenter.defaultCenter().postNotificationName(MSTConstants.NotificationKey.kPostHaveNewData, object: nil)
    }
    
    func saveObject(object: MSEntityBase)
    {
        DMLogin.createWithEntity(object as! DMLogin)
        NSNotificationCenter.defaultCenter().postNotificationName(self.getNotificationKey(), object: nil)
    }
    
    //TODO: We need to remove this from here and put on the MSProcessorBase
    func parseObject(json: JSON) -> MSEntityBase
    {
        return Mapper<DMLogin>().map(String(json))!
    }
    
    
    override func getNotificationKey() -> String
    {
        return ""
    }
    
    override func getEntityName() -> String
    {
        return ""
    }
}
