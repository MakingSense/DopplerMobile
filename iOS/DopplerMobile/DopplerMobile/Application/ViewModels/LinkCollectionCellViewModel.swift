//
//  LinkCollectionCellViewModel.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond
final class LinkCollectionCellViewModel {
    
    let urlString = Observable<String>("")
    let clickOn = Observable<Int>(0)
    let totalClicks = Observable<Int>(0)
    
    init(urlString: String, clickOn: Int, totalClicks: Int) {
        self.urlString.value = urlString
        self.clickOn.value = clickOn
        self.totalClicks.value = totalClicks
    }
}
