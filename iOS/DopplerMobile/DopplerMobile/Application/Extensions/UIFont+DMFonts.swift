//
//  UIFont+DMFonts.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 9/30/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
//Description: This class was created as an easing for UIFont works on Doppler Mobile.

import Foundation
import UIKit

extension UIFont
{
    class func regularOf(size: CGFloat) -> UIFont
    {
        return UIFont(name: "ProximaNova-Regular", size: size)!
    }
    
    class func boldOf(size: CGFloat) -> UIFont
    {
        return UIFont(name: "ProximaNova-Bold", size: size)!
    }
    
    class func lightOf(size: CGFloat) -> UIFont
    {
        return UIFont(name: "ProximaNova-Light", size: size)!
    }
    
    class func blackOf(size: CGFloat) -> UIFont
    {
        return UIFont(name: "ProximaNova-Black", size: size)!
    }
    
    class func regularItalicOf(size: CGFloat) -> UIFont
    {
        return UIFont(name: "ProximaNova-RegularItalic", size: size)!
    }
}
