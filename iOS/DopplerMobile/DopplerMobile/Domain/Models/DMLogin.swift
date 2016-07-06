//
//  DMLogin.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 6/28/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON
import ObjectMapper

@objc(DMLogin)
class DMLogin: MSEntityBase, Mappable
{
    
    class func newInstance(map: Map) -> Mappable?
    {
        return DMLogin()
    }
    
    
    class func createWithEntity(entity: MSEntityBase)
    {
        let postObject = entity as! DMLogin
        let newPostEntity = DMLogin.MR_createEntity()! as DMLogin
        
        newPostEntity.username = postObject.username
        newPostEntity.accountId = postObject.accountId
        newPostEntity.accessToken = postObject.accessToken
        
        // Save
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
    }
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?)
    {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    func mapping(map: Map)
    {
        username       <- map["username"]
        accountId      <- map["accountId"]
        accessToken    <- map["access_token"]
    }
    
    required init?(_ map: Map)
    {
        let dataContext = NSManagedObjectContext.MR_defaultContext()
        let entity = NSEntityDescription.entityForName("DMLogin", inManagedObjectContext: dataContext)
        super.init(entity: entity!, insertIntoManagedObjectContext: dataContext)
        mapping(map)
    }
    
    func getEntityName() -> String
    {
        return "DMLogin"
    }
}
