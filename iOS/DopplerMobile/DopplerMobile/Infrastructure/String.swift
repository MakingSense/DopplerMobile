//
//  File.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/18/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

extension String : StringType
{
    var length: Int
    {
        get
        {
            return self.characters.count
        }
    }
    
    func toNSDateWithFormat(format: String) -> NSDate?
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.dateFromString(self)
        return date
    }
}
