//
//  SuscribersViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class SuscribersListViewModel
{
    private var suscribersService: SuscribersService
    private var contentDelegate: DataSourceContentDelegate?
    
    init(suscribersService: SuscribersService, contentDelegate: DataSourceContentDelegate, listId: Int)
    {
        self.contentDelegate = contentDelegate
        self.suscribersService = suscribersService
        self.suscribersService.downloadSuscribers(listId, notification: NotificationIdentifier.SuscribersNotification.rawValue)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SuscribersListViewModel.OnNotificationArrived(_:)), name:NotificationIdentifier.SuscribersNotification.rawValue, object: nil)
    }
    
    @objc func OnNotificationArrived(notification: NSNotification)
    {
        if(notification.object != nil)
        {
            var suscribers = [SuscriberViewModel]()
            let lists = notification.object as! [Suscriber]
            for list in lists {
                suscribers.append(SuscriberViewModel(suscriber: list))
            }
            contentDelegate?.updateContent(suscribers)
        }
        else
        {
            //TODO: Show error.
        }
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}