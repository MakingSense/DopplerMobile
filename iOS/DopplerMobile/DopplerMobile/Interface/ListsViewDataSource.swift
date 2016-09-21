//
//  ListsViewDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ListsViewDataSource: NSObject, UITableViewDataSource
{
    // MARK: Properties
    var items = [ListDetailViewModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListsTableViewCell.identifier)! as! ListsTableViewCell
        cell.configure(self.items[(indexPath as NSIndexPath).row])
        return cell
    }
}
