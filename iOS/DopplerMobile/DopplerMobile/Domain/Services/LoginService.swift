//
//  LoginService.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

protocol ILoginService
{
    func Login(username: String, password: String)-> Bool
}

public class LoginService: ILoginService
{
    var restClient: RESTClient
    
    ///init(restClient: RESTClient)
    init()
    {
        self.restClient = RESTClient()
    }
    
    func Login(username: String, password: String)-> Bool
    {
        //TODO: will be implemented on DM-52
        let result = restClient.Login(username, password: password)
        return result
    }
}