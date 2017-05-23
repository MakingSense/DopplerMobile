//
//  LinkCollectionViewCell.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import GTProgressBar
import Bond

class LinkCollectionViewCell: UICollectionViewCell {
    
    static let Identifier = "LinkCollectionViewCell"
    static let Height = 90
    
    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var lblTotalClicks: UILabel!
    @IBOutlet weak var progressBar: GTProgressBar!
    
    func configure(_ viewModel: LinkCollectionCellViewModel) {
        viewModel.urlString.bind(to:lblUrl).dispose(in: reactive.bag)
        viewModel.clickOn.map{return "\($0) CLICKS"}.bind(to:lblTotalClicks).dispose(in: reactive.bag)
        viewModel.clickOn.observeNext { [weak self] clickOn in
            guard let strongSelf = self else {
                return
            }
            strongSelf.progressBar.animateTo(progress: CGFloat(clickOn) / CGFloat(viewModel.totalClicks.value))
            }.dispose(in: reactive.bag)
    }
}
