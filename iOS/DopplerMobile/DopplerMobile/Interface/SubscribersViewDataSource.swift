//
//  SuscribersDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SubscribersViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [SubscriberViewModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubscribersTableViewCell.identifier)! as! SubscribersTableViewCell
        cell.configure(self.items[indexPath.row])
        return cell
    }
}
