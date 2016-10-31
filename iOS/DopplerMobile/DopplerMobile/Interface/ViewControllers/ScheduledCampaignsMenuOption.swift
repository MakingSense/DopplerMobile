//
//  BasicInformationMenuOption.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 28/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import PagingMenuController

struct ScheduledCampaignsMenuOption: PagingMenuControllerCustomizable
{
    fileprivate var campaignItem: CampaignViewModel?
    fileprivate var campaignSendingItem: CampaignSendingMockUpViewModel?
    init(item: CampaignViewModel?, viewModel: ScheduledCampaignViewModel)
    {
        self.campaignItem = item
        campaignSendingItem = CampaignSendingMockUpViewModel()
    }
    
    internal var componentType: ComponentType
    {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController]
    {
        let basicInformationViewController = BasicInformationViewController.instantiateFromStoryboard()
        basicInformationViewController.campaignItem = campaignItem
        let recipientsViewController = RecipientsViewController.instantiateFromStoryboard()
        recipientsViewController.campaignItem = campaignItem
        let sendingTableViewController = SendingTableViewController.instantiateFromStoryboard()
        sendingTableViewController.campaignItem = campaignSendingItem
        
        return [basicInformationViewController, recipientsViewController, sendingTableViewController]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable
    {
        var displayMode: MenuDisplayMode
        {
            return .segmentedControl
        }
        var focusMode: MenuFocusMode
        {
            return .underline(height: 3, color: UIColor.accent(), horizontalPadding: 0, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable]
        {
            return [MenuItem1(), MenuItem2(), MenuItem3()]
        }
    }
    
    fileprivate struct MenuItem1: MenuItemViewCustomizable
    {
        var displayMode: MenuItemDisplayMode
        {
            return .text(title: MenuItemText(text: "SCHEDULED_CAMPAIGN_BASIC_INFO_SECTION".localized,
                                             color: UIColor.primary(),
                                             selectedColor: UIColor.accent(),
                                             font: UIFont.regularOf(size: 14.0),
                                             selectedFont: UIFont.regularOf(size: 14.0)))
        }
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable
    {
        var displayMode: MenuItemDisplayMode
        {
            return .text(title: MenuItemText(text: "SCHEDULED_CAMPAIGN_RECIPIENTS".localized,
                                             color: UIColor.primary(),
                                             selectedColor: UIColor.accent(),
                                             font: UIFont.regularOf(size: 14.0),
                                             selectedFont: UIFont.regularOf(size: 14.0)))
        }
    }
    fileprivate struct MenuItem3: MenuItemViewCustomizable
    {
        var displayMode: MenuItemDisplayMode
        {
            return .text(title: MenuItemText(text: "SCHEDULED_CAMPAIGN_SENDING".localized,
                                             color: UIColor.primary(),
                                             selectedColor: UIColor.accent(),
                                             font: UIFont.regularOf(size: 14.0),
                                             selectedFont: UIFont.regularOf(size: 14.0)))
        }
    }
}
