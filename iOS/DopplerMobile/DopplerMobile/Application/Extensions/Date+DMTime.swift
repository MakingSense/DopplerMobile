//
//  Date+DMTime.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/21/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

extension Date
{
    func getTimeWithTimeZone(from date:Date) -> String
    {
        var result: String?
        
        let time = date.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
        
        result?.append(time)
        
        let timezoneAbbreviation = NSTimeZone.local.abbreviation(for: date)
        if (!timezoneAbbreviation.isNullOrEmpty)
        {
            result?.append("("+timezoneAbbreviation!+")")
        }
        
        let localTimeZoneName = (NSTimeZone.local as NSTimeZone).name
        
        result?.append(" "+localTimeZoneName)
        
        return result!
    }
}
