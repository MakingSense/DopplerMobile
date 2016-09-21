//
//  SuscribersDetailViewmodel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 9/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class SuscriberViewModel
{
    open fileprivate(set) var email : String
    open fileprivate(set) var name: String?
    open fileprivate(set) var lastname: String?
    
    init(suscriber: Suscriber)
    {
        self.email = suscriber.email
        self.name =  suscriber.name
        self.lastname = suscriber.lastname
    }
}
