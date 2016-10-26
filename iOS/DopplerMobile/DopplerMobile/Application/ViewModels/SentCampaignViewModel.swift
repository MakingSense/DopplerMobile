//
//  DashboardViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class SentCampaignViewModel
{
    var contentDelegate: DataSourceContentDelegate?
    var campaignsService: CampaignsService!
    var campaigns = [Campaign]()
    var sentCampaigns = [CampaignViewModel]()
    var campaignsReports = [SentCampaignReport]()
    let ITEMS_PER_PAGE = 20
    
    init(campaignsService: CampaignsService, contentDelegate: DataSourceContentDelegate)
    {
        self.campaignsService = campaignsService
        self.contentDelegate = contentDelegate
        self.downloadData(page: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(SentCampaignViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.SentCampaignsNotification.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SentCampaignViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.CampaignReportNotification.rawValue), object: nil)
    }
    
    func downloadData(page: Int)
    {
        self.campaignsService.downloadCampaigns(CampaignStatus.shipped, pageNumber: page, notification: NotificationIdentifier.SentCampaignsNotification.rawValue)
    }
    
    @objc func OnNotificationArrived(_ notification: Notification)
    {
        if(notification.object != nil)
        {
            if (notification.name == NSNotification.Name(rawValue: NotificationIdentifier.SentCampaignsNotification.rawValue))
            {
                campaigns = notification.object as! [Campaign]
                for campaign in campaigns
                {
                    self.campaignsService.downloadCampaignReport(campaign.campaignId!, notification: NotificationIdentifier.CampaignReportNotification.rawValue)
                }
            }
            else
            {
                let report = notification.object as! SentCampaignReport
                campaignsReports.append(report)
                if(campaignsReports.count == ITEMS_PER_PAGE)
                {
                    for index in 0...ITEMS_PER_PAGE - 1
                    {
                        campaigns[index].sentCampaignReport = campaignsReports[index]
                        sentCampaigns.append(CampaignViewModel(campaign: campaigns[index]))
                    }
                    contentDelegate?.updateContent(sentCampaigns as AnyObject)
                    campaignsReports.removeAll()
                    sentCampaigns.removeAll()
                }
            }
        }
        else
        {
            //TODO: Show error.
        }
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
}
