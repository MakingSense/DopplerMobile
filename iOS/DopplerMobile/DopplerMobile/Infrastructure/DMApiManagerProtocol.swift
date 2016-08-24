//
//  DMAPIManagerProtocol.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 26/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

protocol DMApiManagerProtocol: class
{
    func loginUser(username: String, password: String, completionHandler:(Result<User, NSError>) -> Void)
    func getLastSentCampaigns(completionHandler: (Result<[SentCampaign], NSError>) -> Void)
}