//
//  Section.swift
//  DopplerMobile
//
//  Created by Mugu on 11/1/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

open class Section<TItemType>: NSObject
{
    var name: String!
    var items: [TItemType]?
    
    init (name: String!, items: [TItemType]?)
    {
        self.name = name
        self.items = items
    }
}
