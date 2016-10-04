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
    func loginUser(_ username: String, password: String, completionHandler: @escaping (Result<User>) -> Void)
    func getCampaigns(_ status: CampaignStatus, completionHandler: @escaping (Result<[Campaign]>) -> Void)
    func getCampaignPreview(_ campaignId: Int, completionHandler: @escaping (URL?) -> Void)
    func getSuscribersLists(_ completionHandler: @escaping (Result<[List]>) -> Void)
    func getSuscribers(_ listId: Int, completionHandler: @escaping (Result<[Subscriber]>) -> Void)
    func getCampaignRecipients(_ campaignId: Int, completionHandler: @escaping (Result<[CampaignRecipient]>) -> Void)
}
