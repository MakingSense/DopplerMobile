//
//  NSMutableAttributedString.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 9/30/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString
{
    func append(text:String) -> NSMutableAttributedString
    {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        
        return self
    }
    
    func append(text:String, font: UIFont) -> NSMutableAttributedString
    {
        let attributes:[String:AnyObject] = [NSFontAttributeName : font]
        let attributedString = NSMutableAttributedString(string:text, attributes:attributes)
        self.append(attributedString)
        
        return self
    }
}
