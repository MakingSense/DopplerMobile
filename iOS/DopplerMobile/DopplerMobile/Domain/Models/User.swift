//
//  User.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

class User: NSObject, MSResponseJSONObjectSerializable
{
    var username: String?
    var token: String?
    var tokenExpirationDate: String?
    
    required init?(json: JSON) {
        self.username = json["username"].string
        self.token = json["access_token"].string
        self.tokenExpirationDate = json["expiration_date"].string
    }
}