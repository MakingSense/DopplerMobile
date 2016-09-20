//
//  BasicInformationViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 20/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class BasicInformationViewController: UIViewController, UITableViewDelegate
{
    // MARK: Properties
    @IBOutlet weak var tblBasicInformation: UITableView!
    @IBOutlet weak var lblCampaignName: UILabel!
    @IBOutlet weak var lblCampaignType: UILabel!
    var dataSource : BasicInformationDataSource?
    var campaignItem: CampaignViewModel?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tblBasicInformation.delegate = self
        self.navigationItem.title = "SCHEDULED_CAMPAIGNS_TEXT".localized
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.dataSource = BasicInformationDataSource(items: campaignItem?.campaignBasicInformation!)
        self.tblBasicInformation.dataSource = self.dataSource
        self.tblBasicInformation.delegate = self
        self.lblCampaignName.text = campaignItem?.name
        //TODO: remove magical string. replace by campaign type.
        self.lblCampaignType.text = "Classic Campaign"
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let campaignPreviewViewController = segue.destinationViewController as! CampaignPreviewViewController
        campaignPreviewViewController.campaignId = campaignItem!.campaignId
    }
}