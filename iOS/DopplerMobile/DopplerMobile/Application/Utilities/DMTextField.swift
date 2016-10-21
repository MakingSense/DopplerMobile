//
//  DMTextField.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 10/21/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

@IBDesignable
class DMTextField: UITextField
{
    @IBInspectable var topPadding : CGFloat = 0.0
    @IBInspectable var leftPadding : CGFloat = 10.0
    @IBInspectable var bottomPadding : CGFloat = 0.0
    @IBInspectable var rightPadding : CGFloat = 0.0
    
    var padding : UIEdgeInsets
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect
    {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect
    {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    required init(coder aDecoder: NSCoder!)
    {
        self.padding = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        
        super.init(coder: aDecoder)!
    }
}
