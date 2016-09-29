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
    
    init(item: CampaignViewModel?)
    {
        self.campaignItem = item
    }
    
    internal var componentType: ComponentType
    {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController]
    {
        let basicInformationViewController = BasicInformationViewController.instantiateFromStoryboard()
        basicInformationViewController.campaignItem = campaignItem
        return [basicInformationViewController, RecipientsViewController(), SendingViewController()]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable
    {
        var displayMode: MenuDisplayMode
        {
            return .segmentedControl
        }
        //TODO: Add final color and change text color.
        var focusMode: MenuFocusMode
        {
            return .underline(height: 3, color: UIColor(netHex: DMColors.green.rawValue), horizontalPadding: 0, verticalPadding: 0)
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
                                             color: UIColor(netHex: DMColors.grey.rawValue),
                                             selectedColor: UIColor(netHex: DMColors.green.rawValue),
                                             font: UIFont (name: DMFonts.ProximaNovaRegular, size: 14)!,
                                             selectedFont: UIFont (name: DMFonts.ProximaNovaRegular, size: 14)!))
        }
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable
    {
        var displayMode: MenuItemDisplayMode
        {
            return .text(title: MenuItemText(text: "SCHEDULED_CAMPAIGN_RECIPIENTS".localized,
                                             color: UIColor(netHex: DMColors.grey.rawValue),
                                             selectedColor: UIColor(netHex: DMColors.green.rawValue),
                                             font: UIFont (name: DMFonts.ProximaNovaRegular, size: 14)!,
                                             selectedFont: UIFont (name: DMFonts.ProximaNovaRegular, size: 14)!))
        }
    }
    fileprivate struct MenuItem3: MenuItemViewCustomizable
    {
        var displayMode: MenuItemDisplayMode
        {
            return .text(title: MenuItemText(text: "SCHEDULED_CAMPAIGN_SENDING".localized,
                                             color: UIColor(netHex: DMColors.grey.rawValue),
                                             selectedColor: UIColor(netHex: DMColors.green.rawValue),
                                             font: UIFont (name: DMFonts.ProximaNovaRegular, size: 14)!,
                                             selectedFont: UIFont (name: DMFonts.ProximaNovaRegular, size: 14)!))
        }
    }
}
