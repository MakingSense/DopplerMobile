//
//  ReportMenuOption.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import PagingMenuController

struct ReportMenuOption: PagingMenuControllerCustomizable
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
        let reportViewController = ReportViewController.instantiateFromStoryboard()
        reportViewController.reportItem = campaignItem
        return [reportViewController, ReportEmptyViewController(), ReportEmptyViewController()]
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
            return .text(title: MenuItemText(text: "REPORTS_DELIVERY_RATE".localized,
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
            return .text(title: MenuItemText(text: "REPORTS_OPENS_AND_CLICKS".localized,
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
            return .text(title: MenuItemText(text: "REPORTS_LINK_TRACKING".localized,
                                             color: UIColor.primary(),
                                             selectedColor: UIColor.accent(),
                                             font: UIFont.regularOf(size: 14.0),
                                             selectedFont: UIFont.regularOf(size: 14.0)))
        }
    }
}
