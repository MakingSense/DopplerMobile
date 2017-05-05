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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SCHEDULED_CAMPAIGNS_TEXT".localized
        self.tblBasicInformation.delegate = self
        bindView()
    }
    
    func bindView() {
        campaignItem?.campaignBasicInformation.bind(to: tblBasicInformation) { basicInfo, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicInformationTableViewCell.identifier, for: indexPath) as! BasicInformationTableViewCell
            cell.configure(viewModel: basicInfo[indexPath.row])
            return cell
        }
    }
}
