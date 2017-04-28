//
//  PickerTableViewCell.swift
//  DopplerMobile
//
//  Created by Mugu on 11/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import TextFieldEffects

class PickerTableViewCell: UITableViewCell, UIPickerViewDelegate, UITextFieldDelegate
{
    @IBOutlet weak var txtFieldCountry: HoshiTextField!
    static let identifier = "PickerTableViewCell"
    static let height : CGFloat = 70
    
    fileprivate var pickerView : UIPickerView?
    fileprivate var datePickerView : UIDatePicker?
    fileprivate var dataSource : PickerCellDataSource?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configure(model: SubscriberFieldViewModel)
    {
        txtFieldCountry.placeholder = model.title
        model.value.bidirectionalBind(to: txtFieldCountry.reactive.text)
        
        if(model.cellType == SubscriberCellType.countryPicker)
        {
            setupCountryPickerView()
        }
        else
        {
            setupDatePickerView()
        }
    }
    
    func setupCountryPickerView()
    {
        pickerView = UIPickerView()
        
        self.dataSource = PickerCellDataSource()
        pickerView?.delegate = self
        pickerView?.dataSource = dataSource
        
        txtFieldCountry.inputView = pickerView
    }
    
    func setupDatePickerView()
    {
        self.datePickerView = UIDatePicker()
        
        self.datePickerView?.datePickerMode = .date
        self.txtFieldCountry.inputView = datePickerView        
        self.datePickerView?.addTarget(self, action: #selector(PickerTableViewCell.datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    
    func datePickerValueChanged(_ sender: UIDatePicker)
    {        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        txtFieldCountry.text = dateFormatter.string(from: sender.date)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        txtFieldCountry.text = dataSource?.countries?[row]
        self.contentView.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.dataSource?.countries![row]
    }
    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
}
