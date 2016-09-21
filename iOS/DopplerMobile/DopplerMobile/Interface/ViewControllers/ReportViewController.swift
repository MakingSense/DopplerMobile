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
    @IBOutlet fileprivate weak var lblCampaignSubject: UILabel!
    @IBOutlet fileprivate weak var lblCampaignName: UILabel!
    @IBOutlet fileprivate weak var lblCampaignSuscribers: UILabel!
    @IBOutlet fileprivate weak var lblCampaignSentDate: UILabel!
    @IBOutlet fileprivate weak var lblOpenPercentage: UILabel!
    @IBOutlet fileprivate weak var lblUnopenPercentage: UILabel!
    @IBOutlet fileprivate weak var lblBouncesPercentage: UILabel!
    @IBOutlet fileprivate weak var lblRatePercentage: UILabel!
    @IBOutlet fileprivate weak var tblIndicators: UITableView!
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
            let campaignPreviewViewController = segue.destination as! CampaignPreviewViewController
            campaignPreviewViewController.campaignId = reportItem!.campaignId
    }
}
