//
//  CampaignSendingMockUpViewModel.swift
//  DopplerMobile
//
//  Created by Mugu on 11/1/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

//TODO: Remove this class, just for testing pursoses.
class CampaignSendingMockUpViewModel: NSObject
{
    var sections : [Section<SendingCampaignViewModel>]?
    
    
    override init()
    {
        let date : SendingCampaignViewModel = SendingCampaignBasicViewModel(title: "DATE", value: "08/31/2016")
        let hour : SendingCampaignViewModel = SendingCampaignBasicViewModel(title: "HOUR", value: "05:26 PM - (GMT -3) Brasilia")
        let confirmationEmail : SendingCampaignViewModel = SendingCampaignBasicViewModel(title: "CONFIRMATION EMAIL", value: "vzamorano@makingsense.com")
        var defaultSection = Section(name: "", items: [date, hour, confirmationEmail])
        
        let subject : SendingCampaignViewModel = SendingCampaignBasicViewModel(title: "SUBJECT", value: "A Test Subject")
        let resendDate : SendingCampaignViewModel = SendingCampaignBasicViewModel(title: "DATE", value: "09/01/2016")
        let resendHour : SendingCampaignViewModel = SendingCampaignBasicViewModel(title: "HOUR", value: "10:20 AM - (GMT -3) Brasilia")
        let sendTo = SendingCampaignSendToViewModel(title: "SEND TO", notOpen: true, softBounce: true, opened: false)
        var resendSection = Section(name: "Campaign automatically re-send to:", items: [subject, resendDate, resendHour, sendTo])
        
        sections = [defaultSection, resendSection]
    }
}
