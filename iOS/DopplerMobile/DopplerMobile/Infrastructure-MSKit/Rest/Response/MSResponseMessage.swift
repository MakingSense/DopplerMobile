//
//  MSResponseMessage.swift
//  MSRestKit
//
//  Created by Lucas Pelizza on 06/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

class MSResponseMessage
{

    private var responseCode: Int
    private var responseLabel: String
    private var requestData: String

    init(code: Int, label: String)
    {
        self.responseCode = code
        self.responseLabel = label
        self.requestData = ""
    }

    init(code: Int, label: String, requestData: String)
    {
        self.responseCode = code
        self.responseLabel = label
        self.requestData = requestData
    }

    //Unique identifier for API responses
    func getResponseCode() -> Int
    {
        return responseCode
    }

    //Message associated to response code, already localized
    func getResponseLabel() -> String
    {
        return responseLabel;
    }

    //API Response body
    func getRequestData() -> String
    {
        return requestData;
    }
}
