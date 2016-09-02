//
//  DMRouter.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 24/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
let dict = NSDictionary(contentsOfFile: path!)

enum DMApplicationRouter: URLRequestConvertible {
    
    static let baseUrlString = String(dict!.objectForKey("BaseUrlString")!)
    case GetToken([String: AnyObject]) // POST https://restapi.fromdoppler.com/tokens
    case GetCampaigns(String, [String: AnyObject]) //GET https://restapi.fromdoppler.com/accounts/(userName)/campaigns?api_key=(token)
    case GetSuscribersLists(String, [String: AnyObject]) //GET https://restapi.fromdoppler.com/accounts/(userName)/lists?api_key=(token)
    
    var URLRequest: NSMutableURLRequest
    {
        var method: Alamofire.Method
        {
            switch self
            {
            case .GetToken:
                return .POST
            case .GetCampaigns, .GetSuscribersLists:
                return .GET
            }
        }
        
        var encode: Alamofire.ParameterEncoding
        {
            switch self
            {
            case .GetToken:
                return Alamofire.ParameterEncoding.JSON
            case .GetCampaigns, .GetSuscribersLists:
                return Alamofire.ParameterEncoding.URLEncodedInURL
            }
        }
        
        let url:NSURL =
            {
                // build up and return the URL for each endpoint
                let relativePath:String?
                switch self
                {
                case .GetToken:
                    relativePath = "tokens"
                case .GetCampaigns(let username, _):
                    relativePath = "accounts/\(username)/campaigns"
                case .GetSuscribersLists(let username, _):
                    relativePath = "accounts/\(username)/lists"
                }
                
                var URL = NSURL(string: DMApplicationRouter.baseUrlString)!
                if let relativePath = relativePath
                {
                    URL = URL.URLByAppendingPathComponent(relativePath)
                }
                return URL
        }()
        
        let params: ([String: AnyObject]?) =
            {
                switch self
                {
                case .GetToken(let params):
                    return params
                case .GetCampaigns(_, let params):
                    return params
                case .GetSuscribersLists(_, let params):
                    return params
                }
        }()
        
        let URLRequest = NSMutableURLRequest(URL: url)
        let (encodedRequest, _) = encode.encode(URLRequest, parameters: params)
        encodedRequest.HTTPMethod = method.rawValue
        return encodedRequest
    }
}