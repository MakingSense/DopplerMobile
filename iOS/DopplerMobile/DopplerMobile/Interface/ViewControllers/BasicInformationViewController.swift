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
    var dataSource: GenericArrayDataSource<BasicInformationTableViewCell, ListItem>?
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
        self.dataSource = GenericArrayDataSource<BasicInformationTableViewCell, ListItem>(items: (campaignItem?.campaignBasicInformation!)!, cellReuseIdentifier: BasicInformationTableViewCell.identifier)
        self.tblBasicInformation.dataSource = self.dataSource
        self.tblBasicInformation.delegate = self
    }
}
