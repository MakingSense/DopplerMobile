//
//  ListsTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 9/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
import UIKit

class ListsTableViewCell : UITableViewCell
{
    @IBOutlet private weak var lblSuscribersCount: UILabel!
    @IBOutlet private weak var lblListCreationDate: UILabel!
    @IBOutlet private weak var lblListName: UILabel!
    static let identifier = "ListsCell"
    
    // MARK: Actions
    func configure(listDetailViewModel: ListDetailViewModel)
    {
        self.lblListName.text = listDetailViewModel.name
        self.lblListCreationDate.text = listDetailViewModel.creationDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
        self.lblSuscribersCount.text =  String(listDetailViewModel.subscribersCount)
    }
}
