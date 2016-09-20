//
//  CampaignPreviewViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class CampaignPreviewViewModel
{
    private var campaignsService: CampaignsService
    var contentDelegate: DataSourceContentDelegate?
    
    init(campaignsService: CampaignsService, contentDelegate: DataSourceContentDelegate?, campaignId: Int)
    {
        self.campaignsService = campaignsService
        self.contentDelegate = contentDelegate
        self.campaignsService.downloadCampaignPreview(campaignId, notification: NotificationIdentifier.CampaignPreviewNotification.rawValue)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CampaignPreviewViewModel.OnNotificationArrived(_:)), name:NotificationIdentifier.CampaignPreviewNotification.rawValue, object: nil)
    }
    
    //TODO: Check the best place to receive this notification.
    @objc func OnNotificationArrived(notification: NSNotification)
    {
        if(notification.object != nil)
        {
             //TODO: For demo purposes use the following lines:
            let url = NSURL (string: "http://vp.dplract.com/00dc56c471939cca");
            contentDelegate?.updateContent(url!)
            //TODO: For demo purposes comment the following line:
            //contentDelegate?.updateContent(notification.object! as! NSURL)
        }
        else
        {
            //TODO: Show error.
        }
    }
}