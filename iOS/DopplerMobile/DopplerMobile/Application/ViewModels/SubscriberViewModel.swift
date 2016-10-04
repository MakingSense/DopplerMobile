//
//  SuscribersDetailViewmodel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 9/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class SubscriberViewModel
{
    open fileprivate(set) var email : String
    open fileprivate(set) var name: String?
    open fileprivate(set) var lastname: String?
    open fileprivate(set) var subscriberInformation: [ListItem]?
    
    init(suscriber: Subscriber)
    {
        self.email = suscriber.email
        self.name =  suscriber.name
        self.lastname = suscriber.lastname
        self.subscriberInformation = []
        
        for field in suscriber.fields!
        {
            let item = ListItem(name: field.name, value: field.value)
            subscriberInformation?.append(item)
        }
        
        print(self.subscriberInformation)
    }
}
