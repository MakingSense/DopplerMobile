//
//  DMLoginService.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/3/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class DMLoginService : DMLoginServiceProtocol
{
    private let serviceHelper: DMServiceHelperProtocol
    
    required init(serviceHelper: DMServiceHelperProtocol)
    {
        self.serviceHelper = serviceHelper
    }
    
    func login(username: String, password: String)
    {
        self.serviceHelper.login(username, password: password)
    }
}