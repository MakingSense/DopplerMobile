//
//  ReportSegmentViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import PagingMenuController

class ReportSegmentViewController: UIViewController
{
    var campaignItem: CampaignViewModel?
    var sentCampaignViewModel: SentCampaignViewModel!
    @IBOutlet weak var lblCampaignType: UILabel!
    @IBOutlet weak var lblCampaignName: UILabel!
    
    override func viewWillAppear(_ animated: Bool)
    {
        var options: PagingMenuControllerCustomizable
        {
            let options: PagingMenuControllerCustomizable
            options = ReportMenuOption(item: campaignItem)
            return options
        }
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.setup(options)
        self.lblCampaignName.text = campaignItem?.name
        //TODO: Remove magical string.
        self.lblCampaignType.text = "Classic Campaign"
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == SegueIdentifier.CampaignPreviewSegue)
        {
            let campaignPreviewViewController = segue.destination as! CampaignPreviewViewController
            campaignPreviewViewController.campaignId = campaignItem!.campaignId
        }
    }
}
