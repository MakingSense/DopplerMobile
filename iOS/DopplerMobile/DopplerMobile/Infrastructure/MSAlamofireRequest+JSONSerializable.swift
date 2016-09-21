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

extension Alamofire.DataRequest
{
    public func responseObject<T: MSResponseJSONObjectSerializable>(_ completionHandler:
        @escaping (DataResponse<T>) -> Void) -> Self
    {
        let serializer = DataResponseSerializer<T>
            { request, response, data, error in
                guard error == nil else
                {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: error!))
                }
                guard data != nil else
                {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: "Object can't be serialized because input data is nil." as! Error))
                }
                
                let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
                let result = jsonResponseSerializer.serializeResponse(request, response, data, error)
                
                guard case let .success(value) = result else {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: result.error!))
                }
                
                let json = SwiftyJSON.JSON(value)
                // check for "message" errors in the JSON
                if let errorMessage = json["title"].string
                {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: errorMessage as! Error))
                }
                guard let object = T(json: json) else
                {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: "JSON can't be serialized into response object: \(value)" as! Error))
                }
                return .success(object)
        }
        return response(responseSerializer: serializer, completionHandler: completionHandler)
    }
    
    
    public func responseArray<T: MSResponseJSONObjectSerializable>(
        _ completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self
    {
        let serializer = DataResponseSerializer<[T]>
            { request, response, data, error in
                guard error == nil else
                {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: error!))
                }
                guard data != nil else
                {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: "Object can't be serialized because input data is nil." as! Error))
                }
                
                let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
                let result = jsonResponseSerializer.serializeResponse(request, response, data, error)
                
                guard case let .success(value) = result else {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: result.error!))
                }
                
                let json = SwiftyJSON.JSON(value)
                if let errorMessage = json["title"].string
                {
                    return .failure(MSSerializationErrorCode.jsonSerialization(error: errorMessage as! Error))
                }
                var objects: [T] = []
                for (_, item) in json["items"]
                {
                    if let object = T(json: item)
                    {
                        objects.append(object)
                    }
                }
                return .success(objects)
        }
        return response(responseSerializer: serializer, completionHandler: completionHandler)
    }
}
