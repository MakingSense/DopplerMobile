//
//  DailyAxisValueFormatter.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 31/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Charts

class DailyAxisValueFormatter: NSObject, IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let (h,m,_) = DateUtils.secondsToHoursMinutesSeconds(seconds: Int(value))
        return "\(h):\(String(format: "%02d", m))"
    }
}
