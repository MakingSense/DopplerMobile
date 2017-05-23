//
//  LinkTrackingCollectionViewModel.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

final class LinkTrackingCollectionViewModel {
    let links = MutableObservableArray<LinkCollectionCellViewModel>([])
    let totalClicks = Observable<Int>(0)
    
    init() {
        self.totalClicks.value = 500000
        generateLinks()
    }
    
    private func generateLinks() {
        links.removeAll()
        for count in 0...4 {
            let currentClicks = count * 100000
            links.append(LinkCollectionCellViewModel(urlString: "http://www.loremipsum.com/\(count)", clickOn: currentClicks, totalClicks: totalClicks.value))
        }
    }
}
