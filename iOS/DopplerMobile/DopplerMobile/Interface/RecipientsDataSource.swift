//
//  RecipientsDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 4/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class RecipientsDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items: [CampaignRecipient]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipientsTableViewCell.identifier)! as! RecipientsTableViewCell
        cell.configure(items?[indexPath.row])
        return cell
    }
}
