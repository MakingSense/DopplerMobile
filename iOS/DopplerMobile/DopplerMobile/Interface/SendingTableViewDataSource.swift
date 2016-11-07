//
//  SendingTableViewDataSource.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 10/31/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate
{
    // MARK: Properties
    var items: [ListItem]?
    var sections: [Section<SendingCampaignFieldViewModel>]
    var campaignViewModel: CampaignViewModel?
    
    init(sections: [Section<SendingCampaignFieldViewModel>]?, campaignViewModel: CampaignViewModel)
    {
        self.sections = sections!
        self.campaignViewModel = campaignViewModel
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let section = self.sections[indexPath.section]
        var cell : UITableViewCell
        
        switch((section.items?[indexPath.row].type)! as SendingCampaignType)
        {
        case .basic:
            let basicCell = tableView.dequeueReusableCell(withIdentifier: SendingBasicTableViewCell.identifier)! as! SendingBasicTableViewCell
            basicCell.configure(sendingItem: section.items?[indexPath.row] as! SendingCampaignBasicFieldViewModel?, campaignItem: self.campaignViewModel!)
            cell = basicCell
            break
        case .sendingTo:
            let sendToCell = tableView.dequeueReusableCell(withIdentifier: SendingSendToTableViewCell.identifier)! as! SendingSendToTableViewCell
            sendToCell.configure(section.items?[indexPath.row] as! SendingCampaignSendToFieldViewModel?)
            cell = sendToCell
            break
        case .footer:
            let resendCell = tableView.dequeueReusableCell(withIdentifier: SendingFooterTableViewCell.identifier)! as! SendingFooterTableViewCell
            cell = resendCell
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let section = self.sections[indexPath.section]
        
        switch((section.items?[indexPath.row].type)! as SendingCampaignType)
        {
        case .basic:
            return SendingBasicTableViewCell.height
        case .sendingTo:
            return SendingSendToTableViewCell.height
        case .footer:
            return SendingFooterTableViewCell.height
        }
    }    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return (self.sections.count)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "SendingHeaderTableViewCell") as! SendingHeaderTableViewCell
        headerCell.setHeaderTitle(title: self.sections[section].name)
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        let section = self.sections[section]
        if(section.name != "")
        {
            return SendingHeaderTableViewCell.height
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (self.sections[section].items?.count)!
    }
}
