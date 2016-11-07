//
//  SendingCellBasicViewModel.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/2/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingCampaignBasicFieldViewModel: SendingCampaignFieldViewModel
{
    var value: String?
    
    init(title: String, value: String, contentType: SendingCampaignContent)
    {
        self.value = value
        super.init(title: title, type: SendingCampaignType.basic, contentType: contentType)
    }
}
