//
//  InProgressViewController.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/26/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond

class InProgressViewController: UIViewController {

    @IBOutlet weak var imgLoading: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var viewModel: InProgressViewModel = InProgressViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingView()
    }
    
    private func bindingView() {
        viewModel.textDescription.bind(to: lblTitle).dispose(in: reactive.bag)
        viewModel.gif.observeNext { [weak self] gifImage in
            guard let strongSelf = self else {
                return
            }
            strongSelf.imgLoading.image = gifImage
            }.dispose(in: reactive.bag)
        
    }
}
