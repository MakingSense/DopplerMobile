//
//  ArrayDataSource.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 14/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class GenericArrayDataSource<CellType: TableViewCellProtocol, ItemType>: NSObject, UITableViewDataSource, UICollectionViewDataSource
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
        let item = itemAtIndexPath(indexPath)
        cell.configure(item)
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        if items.count <= 0
        {
            return 0
        }
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellReuseIdentifier, forIndexPath: indexPath) as! CellType
        configureCell(cell, atIndexPath: indexPath)
        
        return cell as! UITableViewCell
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int
    {
        if items.count <= 0
        {
            return 0
        }
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
    {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! CellType
        configureCell(cell, atIndexPath: indexPath)
        
        return cell as! UICollectionViewCell
    }
}
