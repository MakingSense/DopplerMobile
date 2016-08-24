//
//  DefaultsKeys.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 29/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let username = DefaultsKey<String?>("username")
    static let accessToken = DefaultsKey<String?>("accessToken")
    static let tokenExpirationDate = DefaultsKey<String?>("expirationDate")
}