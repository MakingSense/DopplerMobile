//
//  DateFormatEnum.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

enum DateFormatEnum: Int
{
    case yyyy_MM_ddTHH_mm_ss_SSSZ
    case yyyy_MM_dd
    case hh_mm

    var pattern: String
    {
        switch self
        {
        case .yyyy_MM_ddTHH_mm_ss_SSSZ:
            return "\("DATE_FORMAT_YYYY_MM_DDTHH_MM_SS_SSSZ".localized)"
        case .yyyy_MM_dd:
            return "\("DATE_FORMAT_YYYY_MM_DD".localized)"
        case .hh_mm:
            return "\("TIME_FORMAT_HH_mm".localized)"
        }
    }
}

