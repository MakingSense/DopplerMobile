//
//  SendingCellViewModel.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/2/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

public enum SendingCampaignType
{
    case basic
    case sendingTo
}

class SendingCampaignViewModel: NSObject
{
    var title: String?
    var type: SendingCampaignType
    
    init(title: String, type: SendingCampaignType)
    {
        self.title = title
        self.type = type
    }
}
