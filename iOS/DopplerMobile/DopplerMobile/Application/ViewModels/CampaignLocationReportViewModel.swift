//
//  CampaignLocationReportViewModel.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

class CampaignLocationReportViewModel: CampaignReportViewModel {
    
    let country = Observable<String>("")
    let opens = Observable<Int>(0)
    
    required init(country: String, opens: Int) {
        self.country.value = country
        self.opens.value = opens
    }
}
