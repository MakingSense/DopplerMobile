//
//  DMImageView.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 16/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DMImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
