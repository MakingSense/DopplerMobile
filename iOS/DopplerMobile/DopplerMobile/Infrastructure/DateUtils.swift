//
//  DateUtils.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

class DateUtils {
    
    struct Format {
        static let ISO8601 = "yyyy-MM-dd'T'HH:mm:ssZ"
        static let MonthDay = "MMM d"
    }
    
    static func parse(dateString: String, format: String? = Format.ISO8601) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)!
    }
    
    static func secondsToHoursMinutesSeconds(seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}
