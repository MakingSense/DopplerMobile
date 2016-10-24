//
//  File.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 28/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class RecipientsViewController: UIViewController, UITableViewDelegate, DataSourceContentDelegate
{
    // MARK: Properties
    var dataSource: GenericArrayDataSource<RecipientsTableViewCell, CampaignRecipient>?
    var campaignItem: CampaignViewModel?
    var recipientsViewModel: RecipientsViewModel!
    var items: [CampaignRecipient] = []
    
    @IBOutlet weak var tblRecipients: UITableView!
    
    class func instantiateFromStoryboard() -> RecipientsViewController
    {
        let storyboard = UIStoryboard(name: StoryboardName.Scheduled, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! RecipientsViewController
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "SCHEDULED_CAMPAIGNS_TEXT".localized
        self.dataSource = GenericArrayDataSource<RecipientsTableViewCell, CampaignRecipient>(items: self.items, cellReuseIdentifier: RecipientsTableViewCell.identifier)
        self.tblRecipients.dataSource = self.dataSource
        self.tblRecipients.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.recipientsViewModel = RecipientsViewModel(suscribersService: SuscribersService(), contentDelegate: self, campaignId: (campaignItem?.campaignId)!)
    }
    
    func updateContent(_ content: AnyObject) {
        dataSource?.items = content as! [CampaignRecipient]
        tblRecipients.reloadData()
    }
}
