//
//  SubscriberInformationViewController.swift
//  DopplerMobile
//
//  Created by Trick Dev on 10/6/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import UIKit

class SubscriberInformationViewController: UIViewController, UITableViewDelegate
{
    // MARK: Properties
    @IBOutlet weak var tblFieldsList: UITableView!
    @IBOutlet weak var lblSubscriberEmail: UILabel!
    @IBOutlet weak var lblSubscriberType: UILabel!
    var dataSource : GenericArrayDataSource<SubscribersInformationViewCell, ListItem>?
    var item: SubscriberViewModel?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tblFieldsList.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.dataSource = GenericArrayDataSource<SubscribersInformationViewCell, ListItem>(items: (self.item?.subscriberInformation)!, cellReuseIdentifier: SubscribersInformationViewCell.identifier)
        self.tblFieldsList.dataSource = self.dataSource
        lblSubscriberEmail.text = self.item?.email
        lblSubscriberType.text = "LISTS_SUBSCRIBER_TYPE".localized
    }
}
