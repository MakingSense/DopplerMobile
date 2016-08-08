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
    @IBOutlet weak var lblCampaignSubject: UILabel!
    @IBOutlet weak var lblCampaignName: UILabel!
    @IBOutlet weak var lblCampaignSuscribers: UILabel!
    @IBOutlet weak var lblCampaignSentDate: UILabel!
    @IBOutlet weak var lblOpenPercentage: UILabel!
    @IBOutlet weak var lblUnopenPercentage: UILabel!
    @IBOutlet weak var lblBouncesPercentage: UILabel!
    @IBOutlet weak var lblRatePercentage: UILabel!
    @IBOutlet weak var tblIndicators: UITableView!
    
    var reportItem: SentCampaignsViewModel?
    {
        didSet { self.configureView() }
    }
    var dataSource : DeliveryRateReportDataSource?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = "REPORTS_TEXT".localized
        self.dataSource = DeliveryRateReportDataSource(viewModel: reportItem!)
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
            lblCampaignSentDate.text = String(reportItem!.sentDate!)
            lblCampaignSubject.text = String(reportItem!.subject!)
            lblBouncesPercentage.text = "\(reportItem!.bouncesPercentage!)%"
            lblUnopenPercentage.text = "\(reportItem!.unopenedPercentage!)%"
            lblOpenPercentage.text = "\(reportItem!.openedPercentage!)%"
            lblRatePercentage.text = "\(reportItem!.ratePercentage!)%"
        }
    }
}