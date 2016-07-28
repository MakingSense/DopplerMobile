//
//  Link.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class Link
{
    var href: String!
    var description: String?
    var rel: String!
    
    init(href: String, description: String?, rel: String)
    {
        self.href = href
        self.description = description
        self.rel = rel
    }
}