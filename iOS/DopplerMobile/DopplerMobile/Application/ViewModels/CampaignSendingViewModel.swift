//
//  CampaignSendingMockUpViewModel.swift
//  DopplerMobile
//
//  Created by Mugu on 11/1/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

//TODO: Remove this class, just for testing pursoses.
class CampaignSendingViewModel: NSObject
{
    var sections : [Section<SendingCampaignFieldViewModel>]?
    
    
    override init()
    {
        super.init()
        sections = self.createSections()
    }
    
    func createSections() -> [Section<SendingCampaignFieldViewModel>]?
    {
        let date : SendingCampaignFieldViewModel = SendingCampaignBasicFieldViewModel(title: "SCHEDULED_SENDING_DATE".localized, value: "08/31/2016", contentType: SendingCampaignContent.date)
        let hour : SendingCampaignFieldViewModel = SendingCampaignBasicFieldViewModel(title: "SCHEDULED_SENDING_HOUR".localized, value: "05:26 PM - (GMT -3) Brasilia", contentType: SendingCampaignContent.hour)
        let confirmationEmail : SendingCampaignFieldViewModel = SendingCampaignBasicFieldViewModel(title: "SCHEDULED_SENDING_CONFIRMATION_EMAIL".localized, value: "vzamorano@makingsense.com", contentType: SendingCampaignContent.confirmationEmail)
        var defaultSection = Section(name: "", items: [date, hour, confirmationEmail])
        
        let subject : SendingCampaignFieldViewModel = SendingCampaignBasicFieldViewModel(title: "SCHEDULED_SENDING_REPLYTO_SUBJECT".localized, value: "A Test Subject", contentType: SendingCampaignContent.resendSubject)
        let resendDate : SendingCampaignFieldViewModel = SendingCampaignBasicFieldViewModel(title: "SCHEDULED_SENDING_DATE".localized, value: "09/01/2016", contentType: SendingCampaignContent.resendDate)
        let resendHour : SendingCampaignFieldViewModel = SendingCampaignBasicFieldViewModel(title: "SCHEDULED_SENDING_HOUR".localized, value: "10:20 AM - (GMT -3) Brasilia", contentType: SendingCampaignContent.resendHour)
        let sendTo = SendingCampaignSendToFieldViewModel(title: "SCHEDULED_SENDING_REPLYTO_SENDTO".localized, notOpen: true, softBounce: true, opened: false, contentType: SendingCampaignContent.resendSendTo)
        let resend = SendingCampaignFieldViewModel(title: "Cancel", type: SendingCampaignType.footer, contentType: SendingCampaignContent.resendSendTo)
        var resendSection = Section(name: "SCHEDULED_SENDING_REPLYTO_SECTION_TITLE".localized, items: [subject, resendDate, resendHour, sendTo, resend])
        
        return [defaultSection, resendSection]
    }
}
