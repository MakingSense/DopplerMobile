//
//  CampaignPreviewViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class CampaignPreviewViewModel
{
    fileprivate var campaignsService: CampaignsService
    var contentDelegate: DataSourceContentDelegate?
    
    init(campaignsService: CampaignsService, contentDelegate: DataSourceContentDelegate?, campaignId: Int)
    {
        self.campaignsService = campaignsService
        self.contentDelegate = contentDelegate
        self.campaignsService.downloadCampaignPreview(campaignId, notification: NotificationIdentifier.CampaignPreviewNotification.rawValue)
        NotificationCenter.default.addObserver(self, selector: #selector(CampaignPreviewViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.CampaignPreviewNotification.rawValue), object: nil)
    }
    
    //TODO: Check the best place to receive this notification.
    @objc func OnNotificationArrived(_ notification: Notification)
    {
        if(notification.object != nil)
        {
             //TODO: For demo purposes use the following lines:
            let url = URL (string: "http://vp.dplract.com/00dc56c471939cca");
            contentDelegate?.updateContent(url! as AnyObject)
            //TODO: For demo purposes comment the following line:
            //contentDelegate?.updateContent(notification.object! as! NSURL)
        }
        else
        {
            //TODO: Show error message.
        }
    }
}
