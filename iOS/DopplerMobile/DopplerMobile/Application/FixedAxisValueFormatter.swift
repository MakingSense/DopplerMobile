//
//  FixedAxisValueFormatter.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 31/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Charts

class FixedAxisValueFormatter: NSObject, IAxisValueFormatter {
    
    let labels: [String]
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return labels[Int(value - 1)]
    }
    
    init(_ labels: [String]) {
        self.labels = labels
    }
}
