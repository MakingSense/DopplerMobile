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
    private var cellReuseIdentifier: String
    private let ITEMS_PER_PAGE = 20
    private var paginationDelegate: DataSourcePaginationDelegate?
    var items: [ItemType]
    var currentPage = 1
    
    convenience init(items: [ItemType], cellReuseIdentifier: String, paginationDelegate: DataSourcePaginationDelegate)
    {
        self.init(items: items, cellReuseIdentifier: cellReuseIdentifier)
        self.paginationDelegate = paginationDelegate
    }
    
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
        if((self.paginationDelegate != nil) && indexPath.row == self.items.count - 1 && (self.items.count % ITEMS_PER_PAGE == 0))
        {
            self.currentPage = self.currentPage + 1
            self.paginationDelegate?.getNextPage(self.currentPage)
        }
        
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
