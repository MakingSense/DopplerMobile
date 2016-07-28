//
//  NSDate.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 30/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

extension NSDate
{
    func toStringWithFormat(format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
}