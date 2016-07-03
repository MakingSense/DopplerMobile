//
//  DMLoginServiceProtocol.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/3/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

protocol DMLoginServiceDelegate
{
    func loginServiceWillBeginLogin()
    func loginServiceDidFinishLogin()
    func loginServiceDidFinishLoginWithError(title: String, description: String)
}

protocol DMLoginServiceProtocol
{
    var delegate : DMLoginServiceDelegate? { get set }
    init(serviceHelper: DMServiceHelperProtocol)
    func login(username: String, password: String)
}
