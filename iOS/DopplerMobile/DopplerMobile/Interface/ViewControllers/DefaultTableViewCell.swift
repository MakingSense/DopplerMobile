//
//  DefaultFieldTableViewCell.swift
//  DopplerMobile
//
//  Created by Mugu on 11/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import TextFieldEffects
import Bond

class DefaultTableViewCell: UITableViewCell
{
    @IBOutlet weak var TextField: HoshiTextField!
    static let identifier = "DefaultTableViewCell"
    static let height: CGFloat = 70
    fileprivate var model: SubscriberFieldViewModel?

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configure(model: SubscriberFieldViewModel)
    {
        self.model = model
        
        TextField.placeholder = self.model?.title
        model.value.bidirectionalBind(to: TextField.bnd_text)
        
        /*if(model.title == "FIELDS_EMAIL".localized.uppercased())
        {
            model.value.bidirectionalBind(to: TextField.bnd_text)
            
            print(model.value)
        }*/
    }
}
