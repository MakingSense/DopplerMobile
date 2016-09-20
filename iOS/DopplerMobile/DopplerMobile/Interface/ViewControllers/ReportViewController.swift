//
//  ReportsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController, UITableViewDelegate
{
    // MARK: Properties
    @IBOutlet private weak var lblCampaignSubject: UILabel!
    @IBOutlet private weak var lblCampaignName: UILabel!
    @IBOutlet private weak var lblCampaignSuscribers: UILabel!
    @IBOutlet private weak var lblCampaignSentDate: UILabel!
    @IBOutlet private weak var lblOpenPercentage: UILabel!
    @IBOutlet private weak var lblUnopenPercentage: UILabel!
    @IBOutlet private weak var lblBouncesPercentage: UILabel!
    @IBOutlet private weak var lblRatePercentage: UILabel!
    @IBOutlet private weak var tblIndicators: UITableView!
    
    var reportItem: CampaignViewModel?
    {
        didSet { self.configureView() }
    }
    var dataSource : DeliveryRateReportDataSource?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = "REPORTS_TEXT".localized
        self.dataSource = DeliveryRateReportDataSource(items: reportItem?.deliveryRateIndicators!)
        tblIndicators.dataSource = self.dataSource
        tblIndicators.delegate = self
        self.configureView()
    }
    
    func configureView()
    {
        if let campaignName = self.lblCampaignName
        {
            campaignName.text = reportItem!.name
            lblCampaignSuscribers.text = String(reportItem!.amountSentSubscribers!)
            lblCampaignSentDate.text = reportItem!.sentDate?.toStringWithFormat(DateFormatEnum.yyyy_MM_dd.pattern)
            lblCampaignSubject.text = reportItem!.subject!
            lblBouncesPercentage.text = "\(reportItem!.bouncesPercentage!)%"
            lblUnopenPercentage.text = "\(reportItem!.unopenedPercentage!)%"
            lblOpenPercentage.text = "\(reportItem!.openedPercentage!)%"
            lblRatePercentage.text = "\(reportItem!.ratePercentage!)%"
        }
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
            let campaignPreviewViewController = segue.destinationViewController as! CampaignPreviewViewController
            campaignPreviewViewController.campaignId = reportItem!.campaignId
    }
}