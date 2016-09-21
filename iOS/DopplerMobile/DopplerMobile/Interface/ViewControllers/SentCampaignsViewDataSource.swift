//
//  SentCampaignsViewDataSource.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/19/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SentCampaignsViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [CampaignViewModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: SentCampaignsTableViewCell.identifier)! as! SentCampaignsTableViewCell
        cell.configure(self.items[(indexPath as NSIndexPath).row])
        return cell
    }
}
