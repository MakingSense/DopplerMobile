//
//  ListsTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 9/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
import UIKit

class ListsTableViewCell : UITableViewCell, TableViewCellProtocol
{
    @IBOutlet fileprivate weak var lblSubscribersCount: UILabel!
    @IBOutlet fileprivate weak var lblListCreationDate: UILabel!
    @IBOutlet fileprivate weak var lblListName: UILabel!
    static let identifier = "ListsCell"
    
    // MARK: Actions
    func configure<T>(viewModel: T) {
        let listDetailViewModel = viewModel as! ListDetailViewModel
        self.lblListName.text = listDetailViewModel.name
        self.lblListCreationDate.text = "\("LISTS_SUBSCRIBER_CREATED_ON".localized)  \((listDetailViewModel.creationDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))!)"
        self.lblSubscribersCount.text = "\(listDetailViewModel.subscribersCount!) \(listDetailViewModel.subscribersCount! == 1 ? "\("REPORTS_SUBSCRIBER".localized)" : "\("REPORTS_SUBSCRIBERS".localized)")"
    }
}
