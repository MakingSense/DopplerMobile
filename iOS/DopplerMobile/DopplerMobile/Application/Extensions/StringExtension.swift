//
//  StringExtension.swift
//  DopplerMobile
//
//  Created by Mugu on 7/19/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

extension String
{
    var localized: String
    {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}