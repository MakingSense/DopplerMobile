//
//  SuscribersListTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SuscribersListsTableViewCell : UITableViewCell
{
    // MARK: Properties
    @IBOutlet private weak var lblSuscribersListName: UILabel!
    @IBOutlet private weak var lblSuscribersListStatistics: UILabel!
    @IBOutlet private weak var lblSuscribersListDate: UILabel!
    static let identifier = "SuscribersListsCell"
    
    // MARK: Actions
    func configure(suscriberListViewModel: SuscribersListViewModel)
    {
        self.lblSuscribersListName.text = suscriberListViewModel.name
        self.lblSuscribersListDate.text = suscriberListViewModel.creationDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
        self.lblSuscribersListStatistics.text =  String(suscriberListViewModel.subscribersCount!)
    }
}
