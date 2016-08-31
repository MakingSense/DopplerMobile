//
//  CampaignStatus.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 30/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

enum CampaignStatus: Int
{
    case draft
    case scheduled
    case shipping
    case shipped
    
    var name: String
    {
        switch self
        {
        case .draft:
            return "draft"
        case .scheduled:
            return "scheduled"
        case .shipping:
            return "shipping"
        case .shipped:
            return "shipped"
        }
    }
}