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
    var sections: [Section<SubscriberFieldViewModel>]?
    var fields: [SubscriberFieldViewModel]?
    
    override init()
    {
        let email : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_EMAIL".localized.uppercased(), contentType: SubscriberFieldContent.email, cellType: SubscriberCellType.datePicker, dataType: SubscriberFieldType.email)
        let firstName : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_FIRSTNAME".localized.uppercased(), contentType: SubscriberFieldContent.field, cellType: SubscriberCellType.base, dataType: SubscriberFieldType.string)
        let lastName : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_LASTNAME".localized.uppercased(), contentType: SubscriberFieldContent.field, cellType: SubscriberCellType.base, dataType: SubscriberFieldType.string)
        let birthDate : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_BIRTHDATE".localized.uppercased(), contentType: SubscriberFieldContent.field, cellType: SubscriberCellType.datePicker, dataType: SubscriberFieldType.date)
        let country : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_COUNTRY".localized.uppercased(), contentType: SubscriberFieldContent.field, cellType: SubscriberCellType.countryPicker, dataType: SubscriberFieldType.country)
        let gender : SubscriberFieldViewModel = SubscriberFieldViewModel(title: "FIELDS_GENDER".localized.uppercased(), contentType: SubscriberFieldContent.field, cellType: SubscriberCellType.gender, dataType: SubscriberFieldType.gender)
        
        let defaultSection = Section(name: "", items: [email, firstName, lastName, birthDate, country, gender])
        
        //TODO: Get Custom Fields
        self.sections = [defaultSection]
        
        self.fields = [email, firstName, lastName, birthDate, country, gender]
    }
}
