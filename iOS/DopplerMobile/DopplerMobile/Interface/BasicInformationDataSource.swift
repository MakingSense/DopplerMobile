//
//  BasicInformationDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 20/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class BasicInformationDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items: [ListItem]?
    init(items: [ListItem]?)
    {
        self.items = items;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (items?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicInformationTableViewCell.identifier)! as! BasicInformationTableViewCell
        cell.configure(items?[(indexPath as NSIndexPath).row])
        return cell
    }
}
