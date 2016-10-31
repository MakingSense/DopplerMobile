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
    var sections: [Section<SendingCampaignViewModel>]
    
    init(sections: [Section<SendingCampaignViewModel>]?)
    {
        self.sections = sections!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let section = self.sections[indexPath.section]
        var cell : UITableViewCell
        
        if(section.items?[indexPath.row].type == SendingCampaignType.basic)
        {
            let basicCell = tableView.dequeueReusableCell(withIdentifier: SendingBasicTableViewCell.identifier)! as! SendingBasicTableViewCell
            basicCell.configure(section.items?[indexPath.row] as! SendingCampaignBasicViewModel?)
            cell = basicCell
        }
        else
        {
            let sendToCell = tableView.dequeueReusableCell(withIdentifier: SendingSendToTableViewCell.identifier)! as! SendingSendToTableViewCell
            sendToCell.configure(section.items?[indexPath.row] as! SendingCampaignSendToViewModel?)
            cell = sendToCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let section = self.sections[indexPath.section]
        if(section.items?[indexPath.row].type == SendingCampaignType.basic)
        {
            
            return SendingBasicTableViewCell.height
        }
        else
        {
            return SendingSendToTableViewCell.height
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let  footerCell = tableView.dequeueReusableCell(withIdentifier: "SendingFooterTableViewCell") as! SendingFooterTableViewCell
        
        return footerCell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat
    {
        let section = self.sections[section]
        if(section.name != "")
        {
            return SendingFooterTableViewCell.height
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
