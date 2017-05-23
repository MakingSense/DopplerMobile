//
//  OpensClicksViewController+UIPickerView.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 31/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import UIKit

extension OpensClicksViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.reportTypes.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.textForInterval(interval: viewModel.reportTypes[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.interval.value = viewModel.reportTypes[row]
        pickerView.isHidden = true
        tabBarController!.tabBar.isHidden = false
    }
}
