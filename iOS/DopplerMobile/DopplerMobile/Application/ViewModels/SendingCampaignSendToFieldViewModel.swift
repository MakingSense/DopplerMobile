//
//  SendingCellSendToViewModel.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/2/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingCampaignSendToFieldViewModel: SendingCampaignFieldViewModel
{
    var notOpen: Bool
    var softBounce: Bool
    var opened: Bool
    
    init(title: String, notOpen: Bool, softBounce: Bool, opened: Bool, contentType: SendingCampaignContent)
    {
        self.notOpen = notOpen
        self.softBounce = softBounce
        self.opened = opened
        super.init(title: title, type: SendingCampaignType.sendingTo, contentType: contentType)
    }
}
