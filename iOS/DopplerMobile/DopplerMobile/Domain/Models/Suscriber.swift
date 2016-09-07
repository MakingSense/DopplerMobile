//
//  Suscriber.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Suscriber: MSResponseJSONObjectSerializable
{
    var email: String!
    var fields: [Field]?
    var belongsToLists: [String]?
    var unsubscribedDate: String?
    var unsubscriptionType: String?
    var manualUnsubscriptionReason: String?
    var unsubscriptionComment: String?
    var status: String?
    var canBeReactivated: String?
    var isBeingReactivated: String?
    //Fields data
    var name: String?
    var lastname: String?
    var birthDate: NSDate?
    var country: String?
    var gender: String?
    
    required public init?(json: JSON)
    {
        self.email = json["email"].string
        if (json["fields"].array) != nil
        {
            self.fields = [Field]()
            for field in json["fields"].array! {
                fields?.append(Field(json: field)!)
            }
            getInformationFromFields()
        }
    }
    
    private func getInformationFromFields()
    {
        if(fields != nil)
        {
            for field in fields!
            {
                switch field.type!
                {
                case .string:
                    if(field.name == "FIRSTNAME")
                    {
                        name = field.value!
                    }
                    else if(field.name == "LASTNAME")
                    {
                        lastname = field.value!
                    }
                    break
                case .date:
                    birthDate = field.value.toNSDateWithFormat(DateFormatEnum.yyyy_MM_ddTHH_mm_ss_SSSZ.pattern)
                    break
                case .gender:
                    gender = field.value
                    break
                case .country:
                    country = field.value
                    break
                case .boolean, .number, .email:
                    break
                }
            }
        }
    }
}