//
//  LoginService.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

class LoginService
{
    let defaults = NSUserDefaults.standardUserDefaults()
    var token = ""
    // Real account information in production environment.
    let API_Key = "F9B113EA00971EC0468FAB1278571522"
    let validUserName = "nreal+freetest1@makingsense.com"
    let validPassword = "1qaz2wsx"
    
    func login(username: String, password: String) -> Bool
    {
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: UserDefaultKey.isUserLoggedIn.rawValue)
		//TODO: Refactor this section when AlamoFire Rest Client has been implemented.
        //TODO: DM-48 Implement generic REST client
        //Temporal Implementation. REMOVE THIS CODE!!!.
        
        // Setup the session to make REST POST call
        var jsonResult = NSDictionary?()
        let semaphore = dispatch_semaphore_create(0)
        let postEndpoint: String = "https://restapi.fromdoppler.com/tokens?api_key=" + API_Key
        let url = NSURL(string: postEndpoint)!
        let session = NSURLSession.sharedSession()
        
        let postParams : [String: AnyObject] = ["grant_type": "password", "username" : validUserName, "password": validPassword]
        
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do
        {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postParams, options: NSJSONWritingOptions())
            print(postParams)
        }
        catch
        {
            print("Exception creating HTTPBody")
        }
        
        // Make the POST call
        session.dataTaskWithRequest(request, completionHandler:
            { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                // Make sure we get an OK response
                guard let realResponse = response as? NSHTTPURLResponse where
                    realResponse.statusCode == 200 else {
                        print("Not a 200 response")
                        dispatch_semaphore_signal(semaphore)
                        return
                }
                
                do
                {
                    if let result = try NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers) as? NSDictionary
                    {
                        jsonResult = result
                        dispatch_semaphore_signal(semaphore)
                    }
                }
                catch let error as NSError
                {
                    print(error.localizedDescription)
                }
        }).resume()
        
        //Only for purposes of testing, we make the call synchronic
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        
        if jsonResult?["access_token"] != nil
        {
            NSUserDefaults.standardUserDefaults().setObject(false, forKey: "userLoggedIn")
            token = jsonResult!["access_token"] as! String
            defaults.setObject(username, forKey: "Username")
            defaults.setObject(token, forKey: "Token")
            return true
        }
        return false
    }
    
    func logout()
    {
        defaults.setObject(false, forKey: "userLoggedIn")
        defaults.setObject("", forKey: "Username")
        defaults.setObject("", forKey: "Token")
    }
    
    
    func GetLoggedUser() -> User
    {
        let username = defaults.stringForKey("Username")!
        let token = defaults.stringForKey("Token")!
        //TODO: Add tokenExpirationDate
        let user = User(username: username, token: token)
        return user
    }
}