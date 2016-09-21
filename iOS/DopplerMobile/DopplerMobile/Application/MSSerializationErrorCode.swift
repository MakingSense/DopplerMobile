//
//  enummm.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 21/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

enum MSSerializationErrorCode: Error {
    case network(error: Error)
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}
