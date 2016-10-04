//
//  Suscriber.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

open class Subscriber: MSResponseJSONObjectSerializable
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
    var birthDate: Date?
    var country: String?
    var gender: String?
    
    required public init?(json: JSON)
    {
        self.email = json["email"].string
        if (json["fields"].array) != nil
        {
            self.fields = initFieldArrayWithDefaults()
            for field in json["fields"].array!
            {
                processAndAppendFields(field: Field(json: field)!)
            }
        }
    }
    
    fileprivate func processAndAppendFields(field: Field)
    {
        switch field.type!
        {
        case .string:
            if(field.name == "FIRSTNAME")
            {
                name = field.value!
                field.name = "FIELDS_FIRSTNAME".localized
                fields?[0] = field
            }
            else if(field.name == "LASTNAME")
            {
                lastname = field.value!
                field.name = "FIELDS_LASTNAME".localized
                fields?[1] = field
            }
            else
            {
                fields?.append(field)
            }
            break
        case .date:
            let date = field.value.toNSDateWithFormat(DateFormatEnum.yyyy_MM_ddTHH_mm_ss_SSSZ.pattern)
            if(field.name == "BIRTHDATE")
            {
                birthDate = date
                field.name = "FIELDS_BIRTHDATE".localized
                fields?[2] = field
            }
            else
            {
                fields?.append(field)
            }
            break
        case .gender:
            if(field.name == "GENDER")
            {
                gender = field.value
                field.name = "FIELDS_GENDER".localized
                fields?[4] = field
            }
            else
            {
                fields?.append(field)
            }
            break
        case .country:
            if(field.name == "COUNTRY")
            {
                country = field.value
                field.name = "FIELDS_COUNTRY".localized
            }
            fields?.append(field)
            break
        case .boolean, .number, .email:
            fields?.append(field)
            break
        }
    }
    
    func initFieldArrayWithDefaults() -> [Field]
    {
        let firstName = Field(name: "FIELDS_FIRSTNAME".localized, value: "--", predefined: true, isPrivate: false, readonly: true, type: FieldType.string)
        let lastName = Field(name: "FIELDS_LASTNAME".localized, value: "--", predefined: true, isPrivate: false, readonly: true, type: FieldType.string)
        let birthdate = Field(name: "FIELDS_BIRTHDATE".localized, value: "--", predefined: true, isPrivate: false, readonly: true, type: FieldType.date)
        let gender = Field(name: "FIELDS_GENDER".localized, value: "--", predefined: true, isPrivate: false, readonly: true, type: FieldType.gender)
        
        return [firstName, lastName, birthdate, gender]
    }
}
