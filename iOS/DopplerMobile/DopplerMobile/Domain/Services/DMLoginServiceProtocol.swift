//
//  DMLoginServiceProtocol.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/3/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

protocol DMLoginServiceProtocol
{
    init(serviceHelper: DMServiceHelperProtocol)
    func login(username: String, password: String)
}
