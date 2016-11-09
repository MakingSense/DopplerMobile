//
//  AddSubscriberField.swift
//  DopplerMobile
//
//  Created by Mugu on 11/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

public enum SubscriberFieldType: String
{
    case base
    case gender
    case countryPicker
    case datePicker
}

class SubscriberFieldViewModel: NSObject
{
    var title: String
    var type: SubscriberFieldType
    
    init(title: String, type: SubscriberFieldType)
    {
        self.title = title
        self.type = type
    }
}
