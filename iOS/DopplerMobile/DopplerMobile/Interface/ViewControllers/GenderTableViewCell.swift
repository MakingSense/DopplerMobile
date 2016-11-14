//
//  GenderTableViewCell.swift
//  DopplerMobile
//
//  Created by Mugu on 11/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import DLRadioButton
import Bond

class GenderTableViewCell: UITableViewCell
{
    @IBOutlet weak var maleRadioButton: DLRadioButton!
    @IBOutlet weak var femaleRadioButton: DLRadioButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMale: UILabel!
    @IBOutlet weak var lblFemale: UILabel!
    
    fileprivate var model: SubscriberFieldViewModel?
    
    static let identifier = "GenderTableViewCell"
    static let height : CGFloat = 150
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configure(model: SubscriberFieldViewModel)
    {
        self.model = model
        
        self.lblTitle.text = self.model?.title
        
        self.lblMale.text = "FIELDS_GENDER_MALE".localized
        self.lblFemale.text = "FIELDS_GENDER_FEMALE".localized
        
        var button = UIButton()
        
        //model.isMale.bidirectionalBind(to: self.lblMale.bnd)
    }
}
