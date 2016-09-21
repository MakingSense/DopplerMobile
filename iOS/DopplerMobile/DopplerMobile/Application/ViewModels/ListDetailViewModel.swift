//
//  SuscribersViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class ListDetailViewModel
{
    open fileprivate(set) var listId : Int?
    open fileprivate(set) var name : String!
    open fileprivate(set) var creationDate: Date?
    open fileprivate(set) var subscribersCount: Int!
    
    init(list: List)
    {
        self.name = list.name
        self.listId = list.listId
        self.creationDate = list.creationDate as Date?
        self.subscribersCount = list.subscribersCount!
    }
}
