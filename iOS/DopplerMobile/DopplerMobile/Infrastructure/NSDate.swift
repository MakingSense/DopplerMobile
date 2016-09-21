//
//  NSDate.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 30/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

extension Date
{
    func toStringWithFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func isGreaterThanDate(_ dateToCompare: Date) -> Bool {
        var isGreater = false
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        return isGreater
    }
}
