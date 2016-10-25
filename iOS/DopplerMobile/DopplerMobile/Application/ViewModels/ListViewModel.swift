//
//  SuscribersListsViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 2/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

open class ListViewModel
{
    fileprivate var suscribersService: SuscribersService
    fileprivate var contentDelegate: DataSourceContentDelegate?
    
    init(suscribersService: SuscribersService, contentDelegate: DataSourceContentDelegate)
    {
        self.contentDelegate = contentDelegate
        self.suscribersService = suscribersService
        self.refreshList()
        NotificationCenter.default.addObserver(self, selector: #selector(ListViewModel.OnNotificationArrived(_:)), name:NSNotification.Name(rawValue: NotificationIdentifier.ListsNotification.rawValue), object: nil)
    }
    
    func refreshList()
    {
        self.suscribersService.downloadSuscribersLists(NotificationIdentifier.ListsNotification.rawValue)
    }
    
    @objc func OnNotificationArrived(_ notification: Notification){
        if(notification.object != nil)
        {
            var listsDetail = [ListDetailViewModel]()
            let lists = notification.object as! [List]
            for list in lists {
                listsDetail.append(ListDetailViewModel(list: list))
            }
            contentDelegate?.updateContent(listsDetail as AnyObject)
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
