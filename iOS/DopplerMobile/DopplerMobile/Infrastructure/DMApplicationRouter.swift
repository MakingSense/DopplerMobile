//
//  DMRouter.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 24/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyUserDefaults

let path = Bundle.main.path(forResource: "Info", ofType: "plist")
let dict = NSDictionary(contentsOfFile: path!)

enum DMApplicationRouter: URLRequestConvertible
{
    
    static let baseUrlString = String(describing: dict!.object(forKey: "BaseUrlString")!)
    case getToken(parameters: Parameters) //POST baseUrl/tokens
    case getCampaigns(username: String, parameters: Parameters) //GET baseUrl/accounts/{accountName}/campaigns
    case getCampaignRecipients(username: String, campaignId: Int) //GET baseUrl/accounts/{accountName}/campaigns/{campaignId}/recipients
    case getCampaignReports(username: String, campaignId: Int) //GET baseUrl/accounts/{accountName}/campaigns/{campaignId}/results-summary
    case getCampaignPreview(username: String, campaignId: Int) //GET baseUrl/accounts/{accountName}/campaigns/{campaignId}/preview
    case getSuscribersLists(username: String, parameters: Parameters) //GET baseUrl/accounts/{accountName}/lists
    case getSuscribers(username: String, listId: Int) //GET baseUrl/accounts/{accountName}/lists/{listId}/subscribers
    case addSubscriber(username: String, listId: Int, parameters: Parameters) //POST baseUrl/accounts/{accountName}/lists/{listId}/subscribers
    
    var method: Alamofire.HTTPMethod
    {
        switch self
        {
        case .getToken, .addSubscriber:
            return .post
        case .getCampaigns, .getCampaignPreview, .getSuscribersLists, .getSuscribers, .getCampaignRecipients, .getCampaignReports:
            return .get
        }
    }
    
    var path:String
    {
        switch self
        {
        case .getToken:
            return "/tokens"
        case .getCampaigns(let username, _):
            return "/accounts/\(username)/campaigns"
        case .getCampaignPreview(let username, let campaignId):
            return "/accounts/\(username)/campaigns/\(campaignId)/preview"
        case .getSuscribersLists(let username, _):
            return "/accounts/\(username)/lists"
        case .getSuscribers(let username, let listId):
            return "/accounts/\(username)/lists/\(listId)/subscribers"
        case .getCampaignRecipients(let username, let campaignId):
            return "/accounts/\(username)/campaigns/\(campaignId)/recipients"
        case .getCampaignReports(let username, let campaignId):
            return "/accounts/\(username)/campaigns/\(campaignId)/results-summary"
        case .addSubscriber(let username, let listId, _):
            return "/accounts/\(username)/lists/\(listId)/subscribers"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest
    {
        let url = try DMApplicationRouter.baseUrlString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        if let token = Defaults[.accessToken]
        {
            urlRequest.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        }
        urlRequest.httpMethod = method.rawValue
        
        switch self
        {
        case .getToken(let parameters), .addSubscriber(_, _, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .getCampaigns(_, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .getSuscribersLists(_, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        return urlRequest
    }
}
