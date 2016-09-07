//
//  SuscribersDetailViewmodel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 9/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class SuscriberViewModel
{
    public private(set) var email : String
    public private(set) var name: String?
    public private(set) var lastname: String?
    
    init(suscriber: Suscriber)
    {
        self.email = suscriber.email
        self.name =  suscriber.name
        self.lastname = suscriber.lastname
    }
}