//
//  SubscriberFieldCountryViewModel.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SubscriberFieldCountryViewModel: SubscriberFieldViewModel
{
    var countries : [String]?
    
    init(title: String)
    {
        super.init(title: title, type: SubscriberFieldType.countryPicker)
        setupCountries()
    }
    
    func setupCountries()
    {
        //TODO: Add proper countries functionality.
        countries = ["Argentina", "Chile", "Brazil", "Colombia", "Uruguay"]
    }
}
