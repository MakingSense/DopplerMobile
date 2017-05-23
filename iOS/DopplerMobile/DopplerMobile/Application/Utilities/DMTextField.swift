//
//  DMTextField.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 10/21/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

@IBDesignable class DMTextField: UITextField {
    
    /// Represents the next field. It can be any responder.
    /// If it is UIButton and enabled then the button will be tapped.
    /// If it is UIButton and disabled then the keyboard will be dismissed.
    /// If it is another implementation, it becomes first responder.
    @IBOutlet open weak var nextResponderField: UIResponder?

    @IBInspectable var topPadding : CGFloat = 0.0
    @IBInspectable var leftPadding : CGFloat = 10.0
    @IBInspectable var bottomPadding : CGFloat = 0.0
    @IBInspectable var rightPadding : CGFloat = 0.0
    
    var padding : UIEdgeInsets
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    required init(coder aDecoder: NSCoder) {
        self.padding = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        super.init(coder: aDecoder)!
        setUp()
    }
    
    private func setUp() {
        addTarget(self, action: #selector(actionKeyboardButtonTapped(sender:)), for: .editingDidEndOnExit)
    }
    
    @objc private func actionKeyboardButtonTapped(sender: UITextField) {
        switch nextResponderField {
        case let button as UIButton where button.isEnabled:
            button.sendActions(for: .touchUpInside)
        case .some(let responder):
            responder.becomeFirstResponder()
        default:
            resignFirstResponder()
        }
    }
    
    deinit {
        removeTarget(self, action: nil, for: .editingDidEndOnExit)
    }
}
