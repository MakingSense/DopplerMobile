//
//  CampaignRecipient.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 5/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

class CampaignRecipient: NSObject, MSResponseJSONObjectSerializable
{
    var id: String!
    var name: String!
    var subscribersCount : Int!
    
    required init?(json: JSON) {
        self.id = json["id"].string
        self.name = json["name"].string
        self.subscribersCount = json["subscribersCount"].int
    }
    
    init (id: String!, name: String!, subscribersCount: Int!)
    {
        self.id = id
        self.name = name
        self.subscribersCount = subscribersCount
    }
}
