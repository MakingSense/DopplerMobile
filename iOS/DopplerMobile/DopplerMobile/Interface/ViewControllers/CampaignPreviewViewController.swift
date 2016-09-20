//
//  CampaignPreviewViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class CampaignPreviewViewController: UIViewController, DataSourceContentDelegate
{
    @IBOutlet private weak var wvCampaignPreview: UIWebView!
    var campaignPreviewViewModel: CampaignPreviewViewModel!
    var campaignId: Int?
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.toolbarHidden = false;
        self.navigationItem.title = "PREVIEW_TEXT".localized
        self.campaignPreviewViewModel = CampaignPreviewViewModel(campaignsService: CampaignsService(), contentDelegate: self, campaignId: campaignId!)
    }
    
    //TODO: remove this when reactive is implemented.
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        self.navigationController!.toolbarHidden = true;
    }
    
    @IBAction func sharePreview(sender: AnyObject)
    {
        //TODO: Analize what information we want to share.
        let message = "Preview URL."
        if let link = NSURL(string: "http://vp.dplract.com/00dc56c471939cca")
        {
            let objectsToShare = [message,link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    func updateContent(content: AnyObject) {
        let requestObj = NSURLRequest(URL: content as! NSURL);
        wvCampaignPreview.loadRequest(requestObj);
    }
}