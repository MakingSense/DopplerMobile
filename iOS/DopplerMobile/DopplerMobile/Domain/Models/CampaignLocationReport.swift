//
//  CampaignLocationReport.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

import Foundation
import SwiftyJSON

class CampaignLocationReport: MSResponseJSONObjectSerializable {
    
    var country: String?
    var clicks: Int?
    
    required public init?(json: JSON) {
        self.country = json["country"].stringValue
        self.clicks = json["clicks"].intValue
    }
}
