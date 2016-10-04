//
//  SubscriberInformationDataSource.swift
//  DopplerMobile
//
//  Created by Trick Dev on 10/6/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import UIKit

class SubscriberInformationDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items: [ListItem]?
    
    init(items: [ListItem]?)
    {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubscribersInformationViewCell.identifier)! as! SubscribersInformationViewCell
        cell.configure(item: items?[indexPath.row])
        
        return cell
    }
}
