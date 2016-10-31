//
//  SendingCellBasicViewModel.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/2/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingCampaignBasicViewModel: SendingCampaignViewModel
{
    var value: String?
    
    init(title: String, value: String)
    {
        self.value = value
        super.init(title: title, type: SendingCampaignType.basic)
    }
}
