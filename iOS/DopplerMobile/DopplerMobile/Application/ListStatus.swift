//
//  ListStatus.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

enum ListStatus: String
{
    case ready
    case draft
    case readyToSent
    case importingSubscribers
    case exportingSubscribers
    case mergingDestination
    case mergingSource
    case cancelingExportingSubscribers
    case inCreationProcess
    case sending
    case inDeletingProcess
    case deleted
}