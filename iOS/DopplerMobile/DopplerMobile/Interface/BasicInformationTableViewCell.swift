//
//  BasicInformationTableViewCell.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 20/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class BasicInformationTableViewCell : UITableViewCell, TableViewCellProtocol
{
    // MARK: Properties
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var lblFieldValue: UILabel!
    static let identifier = "BasicInformationCell"
    
    // MARK: Actions
    func configure<T>(viewModel: T)
    {
        let item = viewModel as? ListItem
        self.lblFieldName.text = item?.name
        self.lblFieldValue.text = item?.value!
    }
}
