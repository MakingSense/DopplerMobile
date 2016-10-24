//
//  GenericArrayDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 24/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
import UIKit

class GenericArrayDataSource<CellType: TableViewCellProtocol, ItemType>: NSObject, UITableViewDataSource
{
    var items: [ItemType]
    var cellReuseIdentifier: String
    
    init(items: [ItemType], cellReuseIdentifier: String)
    {
        self.items = items
        self.cellReuseIdentifier = cellReuseIdentifier
        super.init()
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> ItemType
    {
        return self.items[indexPath.row] as ItemType
    }
    
    func configureCell(cell: CellType, atIndexPath indexPath:NSIndexPath)
    {
        let item = itemAtIndexPath(indexPath: indexPath)
        cell.configure(viewModel: item)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier, for: indexPath as IndexPath) as! CellType
        configureCell(cell: cell, atIndexPath: indexPath as NSIndexPath)
        
        return cell as! UITableViewCell
    }
}
