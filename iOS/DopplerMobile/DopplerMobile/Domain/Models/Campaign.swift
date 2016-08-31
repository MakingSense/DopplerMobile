//
//  SentCampaign.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Campaign: MSResponseJSONObjectSerializable
{
    var campaignId: Int?
    var recipientsRequired: Bool?
    var scheduledDate: NSDate?
    var contentRequired: Bool?
    var name: String!
    var fromName: String!
    var fromEmail: String!
    var subject: String!
    var replyTo: String?
    var preheader: String?
    var status: CampaignStatus?
    var textCampaign: Bool?
    var link: [Link]?
    var sentCampaignReport: SentCampaignReport?
    
    required public init?(json: JSON) {
        self.campaignId = json["campaignId"].int
        self.recipientsRequired = json["recipientsRequired"].bool
        self.contentRequired = json["contentRequired"].bool
        self.name = json["name"].string
        self.fromName = json["fromName"].string
        self.fromEmail = json["fromEmail"].string
        self.subject = json["subject"].string
        self.replyTo = json["replyTo"].string
        //TODO: convert status to CampaignStatus.
        //self.status = json["status"].int! as? CampaignStatus
        let dateString = json["scheduledDate"].string
        if !(dateString.isNullOrEmpty)
        {
            self.scheduledDate = dateString!.toNSDateWithFormat(DateFormatEnum.yyyy_MM_ddTHH_mm_ss_SSSZ.pattern)
        }
        //TODO: Check when get sentCampaignReport Information
        sentCampaignReport = SentCampaignReport()
    }
    
    //TODO: Validate if this method will be used in the app.
    public func dictionaryRepresentation() -> NSDictionary
    {
        //TODO: Remove magical strings.
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.campaignId, forKey: "campaignId")
        dictionary.setValue(self.recipientsRequired, forKey: "recipientsRequired")
        dictionary.setValue(self.contentRequired, forKey: "contentRequired")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.fromName, forKey: "fromName")
        dictionary.setValue(self.fromEmail, forKey: "fromEmail")
        dictionary.setValue(self.subject, forKey: "subject")
        dictionary.setValue(self.replyTo, forKey: "replyTo")
        return dictionary
    }
    
    /**
     Returns an array of models based on given dictionary.
     
     - parameter array:  NSArray from JSON dictionary.
     - returns: Array of Campaigns Instances.
     */
    //TODO: Validate if this method will be used in the app.
    public class func modelsFromDictionaryArray(array: NSArray) -> [Campaign]
    {
        var models:[Campaign] = []
        for item in array
        {
            models.append(Campaign(json: item as! JSON)!)
        }
        return models
    }
}
