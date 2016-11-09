//
//  AddSubscriberMockUpViewModel.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class AddSubscriberMockUpViewModel: NSObject
{
    var sections : [Section<SubscriberFieldViewModel>]?
    
    override init()
    {
        let email : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_EMAIL".localized.uppercased(), type: SubscriberFieldType.base)
        let firstName : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_FIRSTNAME".localized.uppercased(), type: SubscriberFieldType.base)
        let lastName : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_LASTNAME".localized.uppercased(), type: SubscriberFieldType.base)
        let birthDate : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_BIRTHDATE".localized.uppercased(), type: SubscriberFieldType.datePicker)
        let country : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_COUNTRY".localized.uppercased(), type: SubscriberFieldType.countryPicker)
        let gender : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_GENDER".localized.uppercased(), type: SubscriberFieldType.gender)
        
        let defaultSection = Section(name: "", items: [email, firstName, lastName, birthDate, country, gender])
        
        //TODO: Get Custom Fields
        sections = [defaultSection]
    }
}
