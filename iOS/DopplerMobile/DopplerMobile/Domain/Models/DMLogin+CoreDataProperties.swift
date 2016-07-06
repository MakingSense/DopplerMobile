//
//  DMLogin+CoreDataProperties.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/6/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DMLogin
{
    @NSManaged var accessToken: String?
    @NSManaged var accountId: NSNumber?
    @NSManaged var username: String?
}
