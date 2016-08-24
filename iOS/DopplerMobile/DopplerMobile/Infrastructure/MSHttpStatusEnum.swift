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
    case OK_200                     = 200
    case CREATED_201                = 201
    case ACCEPTED_202               = 202
    case BAD_REQUEST_400            = 400
    case UNAUTHORIZED_401           = 401
    case FORBIDDEN_403              = 403
    case NOT_FOUND_404              = 404
    case METHOD_NOT_ALLOWED         = 405
    case REQUEST_TIMEOUT_408        = 408
    case LENGTH_REQUIRED_411        = 411
    case PRECONDITION_FAILED_412    = 412
    case INTERNAL_SERVER_ERROR_500  = 500
    case SERVICE_UNAVAILABLE        = 503
    case UNKNOWN_ERROR              = 999999
}