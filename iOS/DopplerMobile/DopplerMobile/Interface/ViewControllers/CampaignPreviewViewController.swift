//
//  CampaignPreviewViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class CampaignPreviewViewController: UIViewController
{
    @IBOutlet weak var wvCampaignPreview: UIWebView!
    var campaignPreviewViewModel: CampaignPreviewViewModel!
    var campaignId: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "PREVIEW_TEXT".localized
        self.campaignPreviewViewModel = CampaignPreviewViewModel(campaignsService: CampaignsService(), campaignId: campaignId!)
        //TODO: remove this when reactive is implemented.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CampaignPreviewViewController.OnNotificationArrived(_:)), name:NotificationIdentifier.CampaignPreviewNotification.rawValue, object: nil)
    }
    
    //TODO: Check the best place to receive this notification.
    @objc func OnNotificationArrived(notification: NSNotification){
        if(notification.object != nil)
        {
            //TODO: For demo purposes use the following lines:
            let url = NSURL (string: "http://vp.dplract.com/00dc56c471939cca");
            let requestObj = NSURLRequest(URL: url!);
            //TODO: For demo purposes comment the following line:
//            let requestObj = NSURLRequest(URL: notification.object! as! NSURL);
            wvCampaignPreview.loadRequest(requestObj);
        }
        else
        {
            //TODO: Show error.
        }
    }
    
    //TODO: remove this when reactive is implemented.
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}