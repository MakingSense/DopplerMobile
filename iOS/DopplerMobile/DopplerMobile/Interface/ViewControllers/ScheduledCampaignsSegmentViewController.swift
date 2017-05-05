//
//  ScheduledCampaignsSegmentViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 27/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import PagingMenuController
import Bond

class ScheduledCampaignsSegmentViewController: UIViewController
{
    var campaignItem: CampaignViewModel?
    var scheduledCampaignViewModel: ScheduledCampaignViewModel?
    @IBOutlet weak var lblCampaignType: UILabel!
    @IBOutlet weak var lblCampaignName: UILabel!
    
    override func viewWillAppear(_ animated: Bool)
    {
        var options: PagingMenuControllerCustomizable
        {
            let options: PagingMenuControllerCustomizable
            options = ScheduledCampaignsMenuOption(item: campaignItem, viewModel: scheduledCampaignViewModel!)
            return options
        }
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.setup(options)
        campaignItem?.name.bind(to: lblCampaignName)
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
