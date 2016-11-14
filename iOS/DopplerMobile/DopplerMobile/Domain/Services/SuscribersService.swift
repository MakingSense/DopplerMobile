//
//  SuscribersListService.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class SuscribersService
{
    func downloadSuscribersLists(page: Int, notification: String)
    {
        let completionHandler: (Result<[List]>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting suscribers lists data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaigns)
        }
        DMApiManager.sharedInstance.getSuscribersLists(page: page, completionHandler: completionHandler)
    }
    
    func downloadSuscribers(_ listId: Int, notification: String)
    {
        let completionHandler: (Result<[Subscriber]>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting suscribers data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaigns)
        }
        DMApiManager.sharedInstance.getSuscribers(listId, completionHandler: completionHandler)
    }
    
    func downloadCampaignRecipients(_ campaignId: Int, notification: String)
    {
        //TODO: Add Hardcoded information to finish the task. Remove it after API modification.
        var campaignRecipients = [CampaignRecipient]()
        campaignRecipients.append(CampaignRecipient(id: "1458", name: "Graphics Designers", subscribersCount: 3))
        campaignRecipients.append(CampaignRecipient(id: "856", name: "Doctors", subscribersCount: 21))
        campaignRecipients.append(CampaignRecipient(id: "7569", name: "List 3", subscribersCount: 18))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaignRecipients)
        
        //TODO: implement the following code when the API return the correct information.
        /*let completionHandler: (Result<[CampaignRecipient]>) -> Void =
            { result in
                guard result.error == nil else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: String(describing: result.error))
                    return
                }
                guard let campaigns = result.value else
                {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: "Error getting campaign recipient data.")
                    return
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: notification), object: campaigns)
        }
        DMApiManager.sharedInstance.getCampaignRecipients(campaignId, completionHandler: completionHandler)*/
    }
    
    func submitSubscriber(fields: [SubscriberFieldViewModel], listId: Int)
    {
        //Create dictionary
        var subscriberDictionary = Dictionary<String, Any>()
        var fieldsDictionary = Dictionary<String, Any>()
        var fieldsArray = [[String: Any]]()
        
        for field in fields
        {
            switch(field.contentType)
            {
            case .email:
                if let value = field.value.value as String!
                {
                    subscriberDictionary["email"] = value
                }
                break
            case .field:
                if(!field.value.value.isNullOrEmpty) //TODO: Probably this should be checked before.
                {
                    fieldsArray.append(createFieldDictionary(field: field))
                }
                break
            case .belongsToLists: break
            case .unsubscribedDate: break
            case .unsubscriptionType: break
            case .manualUnsubscriptionReason: break
            case .unsubscriptionComment: break
            case .status: break
            case .canBeReactivated: break
            case .isBeingReactivated: break
            case .link: break
            }
        }
        
        subscriberDictionary["fields"] = fieldsArray
        
        let completionHandler: (Result<Subscriber>) -> Void =
            { result in
                guard result.error == nil else
                {
                    print("error")
                    return
                }
                guard let campaigns = result.value else
                {
                    
                    return
                }
        }
        
        DMApiManager.sharedInstance.addSubscriber(listId: listId, subscriber: subscriberDictionary, completionHandler: completionHandler)
    }
    
    func createFieldDictionary(field: SubscriberFieldViewModel) -> [String: Any]
    {
        var fieldDictionary = [String: Any]()
        
        //TODO: I would like to recheck this with someone later.
        switch(field.dataType)
        {
        case .string:
            if let value = field.value.value as String!
            {
                fieldDictionary["value"] = value
                fieldDictionary["type"] = "string"
            }
                break
        case .number:
                break
        case .boolean:
                break
        case .date:
                break
        case .email:
                break
        case .gender:
                break
        case .country:
                break
        }
        
        switch(field.title)
        {
        case "FIELDS_FIRSTNAME".localized.uppercased():
            fieldDictionary["name"] = "FIRSTNAME"
            break
        case "FIELDS_LASTNAME".localized.uppercased():
            fieldDictionary["name"] = "LASTNAME"
            break
        case "FIELDS_BIRTHDATE".localized.uppercased():
            fieldDictionary["name"] = "BIRTHDATE"
            break
        case "FIELDS_GENDER".localized.uppercased():
            fieldDictionary["name"] = "GENDER"
            break
        case "FIELDS_COUNTRY".localized.uppercased():
            fieldDictionary["name"] = "COUNTRY"
            break
        default:
            break
        }
        
        fieldDictionary["predefined"] = false
        fieldDictionary["private"] = true
        fieldDictionary["readonly"] = false
        
        
        return fieldDictionary
    }
}
