//
//  MSHttpStatusEnum.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 25/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public enum MSHttpStatusEnum: Int
{
    case ok_200                     = 200
    case created_201                = 201
    case accepted_202               = 202
    case bad_REQUEST_400            = 400
    case unauthorized_401           = 401
    case forbidden_403              = 403
    case not_FOUND_404              = 404
    case method_NOT_ALLOWED         = 405
    case request_TIMEOUT_408        = 408
    case length_REQUIRED_411        = 411
    case precondition_FAILED_412    = 412
    case internal_SERVER_ERROR_500  = 500
    case service_UNAVAILABLE        = 503
    case unknown_ERROR              = 999999
}
