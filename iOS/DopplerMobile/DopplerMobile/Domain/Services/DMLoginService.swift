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
    var _delegate : DMLoginServiceDelegate?
    var delegate : DMLoginServiceDelegate?
    {
        get { return self._delegate }
        set { self._delegate = newValue }
    }
    
    required init(serviceHelper: DMServiceHelperProtocol)
    {
        self.serviceHelper = serviceHelper
    }
    
    func login(username: String, password: String)
    {
        self.delegate?.loginServiceWillBeginLogin()
        self.serviceHelper.login(username, password: password, callback:
        { (success: Bool, error: NSError?) in
            if (success)
            {
                self.delegate?.loginServiceDidFinishLogin()
            }
            else
            {
                self.delegate?.loginServiceDidFinishLoginWithError("Authentication error", description: "Authentication credentials are invalid")
            }
        })
    }
}