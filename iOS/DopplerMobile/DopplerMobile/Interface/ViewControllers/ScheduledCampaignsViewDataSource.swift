//
//  ScheduledCampaignsViewDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 1/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ScheduledCampaignsViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [CampaignViewModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduledCampaignsTableViewCell.identifier)! as! ScheduledCampaignsTableViewCell
        cell.configure(self.items[(indexPath as NSIndexPath).row])
        return cell
    }
}
