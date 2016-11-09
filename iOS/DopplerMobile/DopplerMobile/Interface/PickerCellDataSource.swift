//
//  PickerTableViewCellDataSource.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/11/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class PickerCellDataSource: NSObject, UIPickerViewDataSource
{
    var countries : [String]?
    
    override init()
    {
        self.countries = ["Argentina", "Chile", "Brazil", "Colombia", "Uruguay"] //TODO: Remove this and use a proper datasource.        
    }
 
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return countries!.count
    }      
    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

}
