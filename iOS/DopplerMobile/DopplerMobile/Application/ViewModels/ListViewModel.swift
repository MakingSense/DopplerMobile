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
    private var contentDelegate: DataSourceContentDelegate?
    
    init(suscribersService: SuscribersService, contentDelegate: DataSourceContentDelegate)
    {
        self.contentDelegate = contentDelegate
        self.suscribersService = suscribersService
        self.suscribersService.downloadSuscribersLists(NotificationIdentifier.ListsNotification.rawValue)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ListViewModel.OnNotificationArrived(_:)), name:NotificationIdentifier.ListsNotification.rawValue, object: nil)
    }
    
    @objc func OnNotificationArrived(notification: NSNotification){
        if(notification.object != nil)
        {
            var listsDetail = [ListDetailViewModel]()
            let lists = notification.object as! [List]
            for list in lists {
                listsDetail.append(ListDetailViewModel(list: list))
            }
            contentDelegate?.updateContent(listsDetail)
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