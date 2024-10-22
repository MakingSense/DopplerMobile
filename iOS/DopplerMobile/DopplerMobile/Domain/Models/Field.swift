//
//  Field.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

open class Field: MSResponseJSONObjectSerializable
{
    var name : String!
    var value : String!
    var predefined : Bool!
    var _private : Bool!
    var readonly : Bool!
    var type : FieldType!
    
    required public init?(json: JSON)
    {
        self.name = json["name"].string
        self.value = json["value"].string
        self.predefined = json["predefined"].bool
        self._private = json["private"].bool
        self.readonly = json["readonly"].bool
        self.type = FieldType(rawValue: json["type"].string!)
    }
    
    init(name: String, value: String, predefined: Bool, isPrivate: Bool, readonly: Bool, type: FieldType)
    {
        self.name = name
        self.value = value
        self.predefined = predefined
        self._private = isPrivate
        self.readonly = readonly
        self.type = type
    }
}
