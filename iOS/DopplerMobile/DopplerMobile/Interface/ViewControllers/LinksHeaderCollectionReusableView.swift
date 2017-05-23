//
//  LinksHeaderCollectionReusableView.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond

class LinksHeaderCollectionReusableView: UICollectionReusableView {
    
    static let Height = 40
    
    @IBOutlet weak var lblTotalClicks: UILabel!
    
    func configure(totalClicks: Observable<Int>) {
        totalClicks.map{return "Clicks: \($0)"}.bind(to:lblTotalClicks).dispose(in: reactive.bag)
    }
}
