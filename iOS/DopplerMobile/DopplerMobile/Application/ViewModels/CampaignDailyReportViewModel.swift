//
//  CampaignDailyReportViewModel.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

class CampaignPeriodicReportViewModel: CampaignReportViewModel {
    
    let date = Observable<Date>(Date())
    let opens = Observable<Int>(0)
    let clicks = Observable<Int>(0)
    
    required init(date: Date, opens: Int, clicks: Int) {
        self.date.value = date
        self.opens.value = opens
        self.clicks.value = clicks
    }
}
