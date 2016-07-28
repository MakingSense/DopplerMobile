//
//  SentCampaignsService.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/7/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class SentCampaignsService
{
    //TODO: remove this data: Real account information in production environment.
    let API_Key = "F9B113EA00971EC0468FAB1278571522"
    let validUserName = "nreal+freetest1@makingsense.com"
    
    func getSentCampaigns() -> [NSDictionary]
    {
        //TODO: Refactor this func After DM-48 Implementation.
        // Send HTTP GET Request. Define server side script URL
        let scriptUrl = "https://restapi.fromdoppler.com/accounts/nreal%2Bfreetest1%40makingsense.com/campaigns?api_key=" + API_Key
        let myUrl = NSURL(string: scriptUrl);
        var result: [NSDictionary]?
        let semaphore = dispatch_semaphore_create(0)
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "GET"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
        {
            data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
                {
                    result = (convertedJsonIntoDict["items"]! as! [NSDictionary])
                    dispatch_semaphore_signal(semaphore)
                }
            }
            catch let error as NSError
            {
                print(error.localizedDescription)
            }
        }
        task.resume()
        //Only for purposes of testing, we wait for the answer.
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return result!
    }
    
    
    func getCampaign(accountName: String!, campaignId: Int!) -> SentCampaign
    {
        //TODO: After DM-48 make the rest call to get the real information.
        return SentCampaign()
    }
}