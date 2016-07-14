//
//  File.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/18/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

extension Optional where Wrapped: StringType
{
    var isNullOrEmpty: Bool
    {
        return self?.isEmpty ?? true; false
    }
}