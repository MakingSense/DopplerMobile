//
//  AddSubscriberTableViewDataSource.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 11/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class AddSubscriberTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var sections: [Section<SubscriberFieldViewModel>]
    
    init(sections: [Section<SubscriberFieldViewModel>]!)
    {
        self.sections = sections
    }
    
    //MARK: Delegate / Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (self.sections[section].items?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let section = self.sections[indexPath.section]
        
        if(section.items?[indexPath.row].cellType == SubscriberCellType.base)
        {
            let basicCell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier)! as! DefaultTableViewCell
            basicCell.configure(model: (section.items?[indexPath.row])!)
            
            return basicCell
        }
        else if(section.items?[indexPath.row].cellType == SubscriberCellType.gender)
        {
            let genderCell = tableView.dequeueReusableCell(withIdentifier: GenderTableViewCell.identifier)! as! GenderTableViewCell
            genderCell.configure(model: (section.items?[indexPath.row])!)
            
            return genderCell
        }
        else
        {
            let pickerCell = tableView.dequeueReusableCell(withIdentifier: PickerTableViewCell.identifier)! as! PickerTableViewCell
            pickerCell.configure(model: (section.items?[indexPath.row])!)
            
            return pickerCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let section = self.sections[indexPath.section]
        
        if(section.items?[indexPath.row].cellType == SubscriberCellType.base || section.items?[indexPath.row].cellType == SubscriberCellType.datePicker || section.items?[indexPath.row].cellType == SubscriberCellType.countryPicker)
        {
            return DefaultTableViewCell.height
        }
        else
        {
            return GenderTableViewCell.height
        }
    }
    
    //MARK: Sections
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return (self.sections.count)
    }
}
