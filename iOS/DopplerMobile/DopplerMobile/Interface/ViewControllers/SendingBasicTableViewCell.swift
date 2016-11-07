//
//  SendingDefaultTableViewCell.swift
//  DopplerMobile
//
//  Created by Juan Muguruza on 10/31/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class SendingBasicTableViewCell: UITableViewCell
{ 
    // MARK: Properties
    static let identifier = "SendingBasicTableViewCell"
    static let height : CGFloat = 51
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!   

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Actions
    func configure(sendingItem: SendingCampaignBasicFieldViewModel?, campaignItem: CampaignViewModel)
    {
        self.lblTitle.text = sendingItem!.title
        
        switch(sendingItem!.contentType as SendingCampaignContent)
        {
        case .date:
            if((campaignItem.sentDate) != nil)
            {
                self.lblValue.text = (campaignItem.sentDate!.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern))
            }
            else
            {
                self.lblValue.text = "NO DATE"
            }
            break
        case .hour:
            if((campaignItem.sentDate) != nil)
            {
                self.lblValue.text = campaignItem.sentDate!.getTimeWithTimeZone(from: campaignItem.sentDate!)
            }
            else
            {
                self.lblValue.text = "NO DATE"
            }
            break
        case .confirmationEmail:
            self.lblValue.text = "NOT ON API" //TODO: This isn't exposed on Doppler API
            break
        case .resendSubject:
            self.lblValue.text = "NOT ON API" //TODO: This isn't exposed on Doppler API
            break
        case .resendDate:
            self.lblValue.text = "NOT ON API" //TODO: This isn't exposed on Doppler API
            break
        case .resendHour:
            self.lblValue.text = "NOT ON API" //TODO: This isn't exposed on Doppler API
            break
        case .resendSendTo:
            //TODO: This isn't exposed on Doppler API
            break
        }
    }
}
