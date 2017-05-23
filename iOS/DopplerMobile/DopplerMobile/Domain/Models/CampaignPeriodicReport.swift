//
//  CampaignDailyReport.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

class CampaignPeriodicReport: MSResponseJSONObjectSerializable {
    
    var date: Date?
    var clicks: Int?
    var opens: Int?
    
    required public init?(json: JSON) {
        self.date = DateUtils.parse(dateString: json["date"].stringValue)
        self.clicks = json["clicks"].int
        self.opens = json["opens"].int
    }
}
