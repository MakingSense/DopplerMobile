//
//  SuscribersListsViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class ListViewModel
{
    private var suscribersService: SuscribersService
    private var navigationDelegate: NavigationDelegate?
    
    init(suscribersService: SuscribersService)
    {
        self.suscribersService = suscribersService
        self.suscribersService.downloadSuscribersLists(NotificationIdentifier.SuscribersListsNotification.rawValue)
    }
    
    //TODO: Get the notification message and then inform to datamodel using a delegate.
}