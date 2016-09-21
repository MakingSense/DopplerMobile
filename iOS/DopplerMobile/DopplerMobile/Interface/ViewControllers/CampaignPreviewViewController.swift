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
    @IBOutlet fileprivate weak var wvCampaignPreview: UIWebView!
    var campaignPreviewViewModel: CampaignPreviewViewModel!
    var campaignId: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isToolbarHidden = false;
        self.navigationItem.title = "PREVIEW_TEXT".localized
        self.campaignPreviewViewModel = CampaignPreviewViewModel(campaignsService: CampaignsService(), contentDelegate: self, campaignId: campaignId!)
    }
    
    //TODO: remove this when reactive is implemented.
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        self.navigationController!.isToolbarHidden = true;
    }
    
    @IBAction func sharePreview(_ sender: AnyObject)
    {
        //TODO: Analize what information we want to share.
        let message = "Preview URL."
        if let link = URL(string: "http://vp.dplract.com/00dc56c471939cca")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func updateContent(_ content: AnyObject) {
        let requestObj = URLRequest(url: content as! URL);
        wvCampaignPreview.loadRequest(requestObj);
    }
}
