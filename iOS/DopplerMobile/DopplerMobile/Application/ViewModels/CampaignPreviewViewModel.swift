//
//  CampaignPreviewViewModel.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

@objc class CampaignPreviewViewModel: NSObject {
    
    private let campaignsService: CampaignsService
    let isBusy = Observable<Bool>(false)
    let urlPreview = Observable<URL?>(nil)
    let activityShare = Observable<UIActivityViewController?>(nil)
    var shareCanExecute: Signal<Bool, NoError> {
        return combineLatest(urlPreview, isBusy) { urlPreview, isBusy in
            return urlPreview != nil && !isBusy
        }
    }
    
    init(campaignsService: CampaignsService, campaignId: Int) {
        self.campaignsService = campaignsService
        isBusy.value = true
        super.init()
        self.campaignsService.downloadCampaignPreview(campaignId, notification: NotificationIdentifier.CampaignPreviewNotification.rawValue)
        self.setupNotifications()
    }
    
    private func setupNotifications() {
        NotificationCenter
            .default
            .reactive
            .notification(name: NSNotification.Name(rawValue: NotificationIdentifier.CampaignPreviewNotification.rawValue))
            .observeNext { [weak self] notification in
                guard let strongSelf = self else {
                    return
                }
                defer {
                    strongSelf.isBusy.value = false
                }
                strongSelf.onNotificationArrived(notification)
            }
            .dispose(in: reactive.bag)
    }
    
    //TODO: Check the best place to receive this notification.
    func onNotificationArrived(_ notification: Notification) {
        isBusy.value = false
        if let object = notification.object {
            urlPreview.value = object as? URL
        } else {
            //TODO: Show error message.
        }
    }
    
    func sharePreview() {
        //TODO: Analize what information we want to share.
        let message = "Preview URL."
        if let link = urlPreview.value {
            let objectsToShare = [message,link] as [Any]
            activityShare.value =  UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        }
    }
}
