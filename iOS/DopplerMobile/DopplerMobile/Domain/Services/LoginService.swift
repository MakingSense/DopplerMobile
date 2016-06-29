//
//  LoginService.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class LoginService
{
    var restClient: RESTClient
    
    init(restClient: RESTClient)
    {
        self.restClient = restClient
    }
    
    func Login(username: String, password: String)-> Bool
    {
        //TODO: will be implemented on DM-52
        let result = restClient.Login(username, password: password)
        return result
    }
}