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
    @IBOutlet weak var lblSuscribersListName: UILabel!
    @IBOutlet weak var lblSuscribersListStatistics: UILabel!
    @IBOutlet weak var lblSuscribersListDate: UILabel!
    static let identifier = "SuscribersListsCell"
    
    // MARK: Actions
    func configure(suscriberListViewModel: SuscribersListViewModel)
    {
        self.lblSuscribersListName.text = suscriberListViewModel.name
        self.lblSuscribersListDate.text = suscriberListViewModel.creationDate
        self.lblSuscribersListStatistics.text =  suscriberListViewModel.subscribersCount
    }
}
