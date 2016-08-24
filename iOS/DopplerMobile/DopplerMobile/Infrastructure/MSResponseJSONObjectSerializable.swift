//
//  ResponseJSONObjectSerializable.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 24/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol MSResponseJSONObjectSerializable
{
    init?(json: SwiftyJSON.JSON)
}