//
//  SuscribersViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class SuscribersListViewModel
{
    fileprivate var suscribersService: SuscribersService
    fileprivate var contentDelegate: DataSourceContentDelegate?
    
    init(suscribersService: SuscribersService, contentDelegate: DataSourceContentDelegate, listId: Int)
    {
        self.contentDelegate = contentDelegate
        self.suscribersService = suscribersService
        self.suscribersService.downloadSuscribers(listId, notification: NotificationIdentifier.SuscribersNotification.rawValue)
        NotificationCenter.default.addObserver(self, selector: #selector(SuscribersListViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.SuscribersNotification.rawValue), object: nil)
    }
    
    @objc func OnNotificationArrived(_ notification: Notification)
    {
        if(notification.object != nil)
        {
            var suscribers = [SuscriberViewModel]()
            let lists = notification.object as! [Suscriber]
            for list in lists {
                suscribers.append(SuscriberViewModel(suscriber: list))
            }
            contentDelegate?.updateContent(suscribers as AnyObject)
        }
        else
        {
            //TODO: Show error.
        }
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
}
