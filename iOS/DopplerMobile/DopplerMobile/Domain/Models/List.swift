//
//  List.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

public class List: MSResponseJSONObjectSerializable
{
    var listId : Int?
    var name : String!
    var currentStatus : String?
    var subscribersCount : Int?
    var creationDate : NSDate?
    var deletedDate : NSDate?
    var hasScheduledCampaigns : Bool?
    var hasFormsAssociated : Bool?
    var hasSegmentsAssociated : Bool?
    var hasEventsAssociated : Bool?
    
    required public init?(json: JSON)
    {
        self.listId = json["listId"].int
        self.name = json["name"].string
        //TODO: convert status to ListStatus.
        self.currentStatus = json["currentStatus"].string
        self.subscribersCount = json["subscribersCount"].int
        self.hasScheduledCampaigns = json["hasScheduledCampaigns"].bool
        self.hasFormsAssociated = json["hasFormsAssociated"].bool
        self.hasSegmentsAssociated = json["hasSegmentsAssociated"].bool
        self.hasEventsAssociated = json["hasEventsAssociated"].bool
        self.creationDate = (json["creationDate"].string).isNullOrEmpty ? nil : (json["creationDate"].string)!.toNSDateWithFormat(DateFormatEnum.yyyy_MM_ddTHH_mm_ss_SSSZ.pattern)
        self.deletedDate = (json["deletedDate"].string).isNullOrEmpty ? nil : (json["deletedDate"].string)!.toNSDateWithFormat(DateFormatEnum.yyyy_MM_ddTHH_mm_ss_SSSZ.pattern)
    }
}