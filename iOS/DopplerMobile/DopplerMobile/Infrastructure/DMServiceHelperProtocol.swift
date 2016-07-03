//
//  DMServiceHelperProtocol.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/3/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

protocol DMServiceHelperProtocol
{
    func login(username: String, password: String, callback: (success:Bool, error:NSError?) -> Void)
    func getCampains()
}