//
//  AlamofireRequest+JSONSerializable.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 24/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension Alamofire.Request
{
    public func responseObject<T: MSResponseJSONObjectSerializable>(completionHandler:
        Response<T, NSError> -> Void) -> Self
    {
        let serializer = ResponseSerializer<T, NSError>
            { request, response, data, error in
                guard error == nil else
                {
                    return .Failure(error!)
                }
                guard let responseData = data else
                {
                    let failureReason = "Object can't be serialized because input data is nil."
                    let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                    let error = NSError(domain: MSSerializationErrorCode.Domain, code: MSSerializationErrorCode.Code.JSONSerializationFailed.rawValue, userInfo: userInfo)
                    return .Failure(error)
                }
                
                let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
                let result = JSONResponseSerializer.serializeResponse(request, response,
                    responseData, error)
                switch result
                {
                case .Failure(let error):
                    return .Failure(error)
                case .Success(let value):
                    let json = SwiftyJSON.JSON(value)
                    // check for "message" errors in the JSON
                    if let errorMessage = json["title"].string
                    {
                        let userInfo = [NSLocalizedFailureReasonErrorKey: errorMessage]
                        let error = NSError(domain: MSSerializationErrorCode.Domain, code: MSSerializationErrorCode.Code.JSONSerializationFailed.rawValue, userInfo: userInfo)
                        return .Failure(error)
                    }
                    guard let object = T(json: json) else
                    {
                        let failureReason = "JSON can't be serialized into response object: \(value)"
                        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                        let error = NSError(domain: MSSerializationErrorCode.Domain, code: MSSerializationErrorCode.Code.JSONSerializationFailed.rawValue, userInfo: userInfo)
                        return .Failure(error)
                    }
                    return .Success(object)
                }
        }
        return response(responseSerializer: serializer, completionHandler: completionHandler)
    }
    
    public func responseArray<T: MSResponseJSONObjectSerializable>(
        completionHandler: Response<[T], NSError> -> Void) -> Self
    {
        let serializer = ResponseSerializer<[T], NSError>
            { request, response, data, error in
                guard error == nil else
                {
                    return .Failure(error!)
                }
                guard let responseData = data else
                {
                    let failureReason = "Array can't be be serialized because input data is nil."
                    let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                    let error = NSError(domain: MSSerializationErrorCode.Domain, code: MSSerializationErrorCode.Code.JSONSerializationFailed.rawValue, userInfo: userInfo)
                    return .Failure(error)
                }
                let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
                let result = JSONResponseSerializer.serializeResponse(request, response,
                    responseData, error)
                switch result
                {
                case .Failure(let error):
                    return .Failure(error)
                case .Success(let value):
                    let json = SwiftyJSON.JSON(value)
                    // check for "message" errors in the JSON
                    if let errorMessage = json["title"].string
                    {
                        let userInfo = [NSLocalizedFailureReasonErrorKey: errorMessage]
                        let error = NSError(domain: MSSerializationErrorCode.Domain, code: MSSerializationErrorCode.Code.JSONSerializationFailed.rawValue, userInfo: userInfo)
                        return .Failure(error)
                    }
                    var objects: [T] = []
                    for (_, item) in json["items"]
                    {
                        if let object = T(json: item)
                        {
                            objects.append(object)
                        }
                    }
                    return .Success(objects)
                }
        }
        return response(responseSerializer: serializer, completionHandler: completionHandler)
    }
}