//
//  SuscribersTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SuscribersTableViewCell : UITableViewCell
{
    // MARK: Properties
    @IBOutlet weak var lblSuscriberEmail: UILabel!
    @IBOutlet weak var lblSuscriberName: UILabel!
    static let identifier = "SuscribersCell"
    
    // MARK: Actions
    func configure(_ suscriberViewModel: SuscriberViewModel)
    {
        self.lblSuscriberEmail.text = suscriberViewModel.email
        self.lblSuscriberName.text = "\(suscriberViewModel.name!) \(suscriberViewModel.lastname!)"
    }
}
