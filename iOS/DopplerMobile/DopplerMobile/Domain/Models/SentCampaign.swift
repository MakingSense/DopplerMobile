//
//  SentCampaign.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class SentCampaign
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
    
    init()
    {
        self.name = "name"
        self.fromName = "from name"
        self.fromEmail = "from email"
        self.subject = "subject"
    }
    
    //TODO: Refactor initializer.
    init(name: String, scheduledDate: NSDate, fromName: String, fromEmail: String, subject: String, sentCampaignReport: SentCampaignReport)
    {
        self.name = name
        self.scheduledDate = scheduledDate
        self.fromName = fromName
        self.fromEmail = fromEmail
        self.subject = subject
        //TODO: Check when get sentCampaignReport Information
        self.sentCampaignReport = sentCampaignReport
    }
    
    required public init?(dictionary: NSDictionary)
    {
        //TODO: Remove magical strings.
        campaignId = dictionary["campaignId"] as? Int
        recipientsRequired = dictionary["recipientsRequired"] as? Bool
        let dateString = dictionary["scheduledDate"] as? String
        if !(dateString.isNullOrEmpty)
        {
            scheduledDate = dateString!.toNSDateWithFormat("yyyy-MM-dd'T'HH:mm:ssZ")
        }
        contentRequired = dictionary["contentRequired"] as? Bool
        name = dictionary["name"] as! String
        fromName = dictionary["fromName"] as! String
        fromEmail = dictionary["fromEmail"] as! String
        subject = dictionary["subject"] as! String
        replyTo = dictionary["replyTo"] as? String
        status = dictionary["status"] as? CampaignStatus
        //TODO: Check when get sentCampaignReport Information
        sentCampaignReport = SentCampaignReport()
    }
    
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
    public class func modelsFromDictionaryArray(array: NSArray) -> [SentCampaign]
    {
        var models:[SentCampaign] = []
        for item in array
        {
            models.append(SentCampaign(dictionary: item as! NSDictionary)!)
        }
        return models
    }
}
