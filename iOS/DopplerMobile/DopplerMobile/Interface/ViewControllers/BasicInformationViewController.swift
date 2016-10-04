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
    var dataSource : BasicInformationDataSource?
    var campaignItem: CampaignViewModel?
    @IBOutlet weak var tblBasicInformation: UITableView!
    
    class func instantiateFromStoryboard() -> BasicInformationViewController
    {
        let storyboard = UIStoryboard(name: StoryboardName.Scheduled, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! BasicInformationViewController
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationItem.title = "SCHEDULED_CAMPAIGNS_TEXT".localized
        self.dataSource = BasicInformationDataSource(items: campaignItem?.campaignBasicInformation!)
        self.tblBasicInformation.dataSource = self.dataSource
        self.dataSource?.items = campaignItem?.campaignBasicInformation
        self.tblBasicInformation.reloadData()
        self.tblBasicInformation.delegate = self
    }
}
