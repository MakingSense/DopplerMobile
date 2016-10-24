//
//  SuscribersTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SubscribersTableViewCell : UITableViewCell, TableViewCellProtocol
{
    // MARK: Properties
    @IBOutlet weak var lblSubscriberEmail: UILabel!
    @IBOutlet weak var lblSubscriberName: UILabel!
    static let identifier = "SuscribersCell"
    
    // MARK: Actions
    
    func configure<T>(viewModel: T)
    {
        let suscriberViewModel = viewModel as! SubscriberViewModel
        self.lblSubscriberEmail.text = suscriberViewModel.email
        self.lblSubscriberName.text = "\(suscriberViewModel.name ?? "-") \(suscriberViewModel.lastname ?? "-")"
    }
}
