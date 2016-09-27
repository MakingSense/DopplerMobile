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
    func bold(text:String, fontName: String, fontSize: CGFloat) -> NSMutableAttributedString
    {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont(name: fontName, size: CGFloat(fontSize))!]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.append(boldString)
        
        return self
    }
    
    func normal(text:String) -> NSMutableAttributedString
    {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        
        return self
    }
}
