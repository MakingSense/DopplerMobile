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
    case footer
}

public enum SendingCampaignContent
{
    case date
    case hour
    case confirmationEmail
    case resendSubject
    case resendDate
    case resendHour
    case resendSendTo
}

class SendingCampaignFieldViewModel: NSObject
{
    var title: String?
    var type: SendingCampaignType
    var contentType: SendingCampaignContent
    
    init(title: String, type: SendingCampaignType, contentType: SendingCampaignContent)
    {
        self.title = title
        self.type = type
        self.contentType = contentType
    }
}
