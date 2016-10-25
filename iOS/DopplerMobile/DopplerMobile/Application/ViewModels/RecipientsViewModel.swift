//
//  RecipientsViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 5/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
import Foundation

class RecipientsViewModel
{
    var subscribersService: SuscribersService!
    var contentDelegate: DataSourceContentDelegate?
    init(suscribersService: SuscribersService, contentDelegate: DataSourceContentDelegate, campaignId: Int)
    {
        self.contentDelegate = contentDelegate
        self.subscribersService = suscribersService
        NotificationCenter.default.addObserver(self, selector: #selector(ScheduledCampaignViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.CampaignRecipientsNotification.rawValue), object: nil)
        self.refreshList(campaignId: campaignId)
    }
    
    func refreshList(campaignId: Int)
    {
        self.subscribersService.downloadCampaignRecipients(campaignId, notification: NotificationIdentifier.CampaignRecipientsNotification.rawValue)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func OnNotificationArrived(_ notification: Notification)
    {
        if(notification.object != nil)
        {
            let campaignRecipients = notification.object as! [CampaignRecipient]
            contentDelegate?.updateContent(campaignRecipients as AnyObject)
        }
        else
        {
            //TODO: Show error.
        }
    }
}

