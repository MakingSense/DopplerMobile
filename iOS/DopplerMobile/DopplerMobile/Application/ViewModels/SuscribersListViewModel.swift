//
//  SuscribersViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class SuscribersListViewModel
{
    public private(set) var name : String
    public private(set) var creationDate: String?
    public private(set) var subscribersCount: String?
    
    init(list: List)
    {
        self.name = list.name
        self.creationDate = list.creationDate == nil ? "No Date" : list.creationDate!.toStringWithFormat("yyyy-MM-dd")
        self.subscribersCount = String(list.subscribersCount!)
    }
}