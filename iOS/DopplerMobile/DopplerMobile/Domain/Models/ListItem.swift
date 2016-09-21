//
//  ListItem.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 20/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class ListItem{
    var name : String!
    var value : String?
    
    init (name: String!, value: String?)
    {
        self.name = name
        self.value = value
    }
}
