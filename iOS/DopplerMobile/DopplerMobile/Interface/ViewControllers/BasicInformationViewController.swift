//
//  BasicInformationViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 20/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class BasicInformationViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate
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
        self.dataSource = BasicInformationDataSource(items: campaignItem?.campaignBasicInformation!)
        self.navigationItem.title = "SCHEDULED_CAMPAIGNS_TEXT".localized
        self.tblBasicInformation.dataSource = self.dataSource
        self.tblBasicInformation.delegate = self
    }
    
    func updateContent(_ content: AnyObject) {
        let campaignViewModel = content as! CampaignViewModel
        self.dataSource?.items = campaignViewModel.campaignBasicInformation
        tblBasicInformation.reloadData()
    }
}
