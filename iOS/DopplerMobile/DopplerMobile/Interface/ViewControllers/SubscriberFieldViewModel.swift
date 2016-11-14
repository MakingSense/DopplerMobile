//
//  AddSubscriberField.swift
//  DopplerMobile
//
//  Created by Mugu on 11/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import Bond

public enum SubscriberFieldType: String
{
    case string
    case number
    case boolean
    case date
    case email
    case gender
    case country
}

public enum SubscriberCellType: String
{
    case base
    case gender
    case countryPicker
    case datePicker
}

public enum SubscriberFieldContent: String
{
    case email
    case field
    case belongsToLists
    case unsubscribedDate
    case unsubscriptionType
    case manualUnsubscriptionReason
    case unsubscriptionComment
    case status
    case canBeReactivated
    case isBeingReactivated
    case link
}

class SubscriberFieldViewModel: NSObject
{
    var title: String
    var cellType: SubscriberCellType
    var contentType: SubscriberFieldContent
    var dataType: SubscriberFieldType
    var value: Observable<String?>
    var isMale: Observable<Bool?> //TODO: This might not need to be here.
    
    init(title: String, contentType: SubscriberFieldContent, cellType: SubscriberCellType, dataType: SubscriberFieldType)
    {
        self.title = title
        self.cellType = cellType
        self.dataType = dataType
        self.contentType = contentType
        self.value = Observable<String?>("")
        self.isMale = Observable<Bool?>(true)
    }
}
