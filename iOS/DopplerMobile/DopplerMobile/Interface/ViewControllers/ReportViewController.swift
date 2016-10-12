//
//  ReportsViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 8/8/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import Charts

class ReportViewController: UIViewController, UITableViewDelegate
{
    // MARK: Properties
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet fileprivate weak var lblOpenPercentage: UILabel!
    @IBOutlet fileprivate weak var lblUnopenPercentage: UILabel!
    @IBOutlet fileprivate weak var lblBouncesPercentage: UILabel!
    @IBOutlet fileprivate weak var lblRatePercentage: UILabel!
    @IBOutlet fileprivate weak var tblIndicators: UITableView!
    var reportItem: CampaignViewModel?
    var dataSource : DeliveryRateReportDataSource?
    
    class func instantiateFromStoryboard() -> ReportViewController
    {
        let storyboard = UIStoryboard(name: StoryboardName.Reports, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! ReportViewController
    }
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = "REPORTS_TEXT".localized
        self.tblIndicators.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.dataSource = DeliveryRateReportDataSource(items: reportItem?.deliveryRateIndicators!)
        self.tblIndicators.dataSource = self.dataSource
        self.configureView()
    }
    
    func configureView()
    {
        self.lblBouncesPercentage.text =  reportItem?.bouncesPercentage == nil ? "0%" : "\((reportItem?.bouncesPercentage!)!)%"
        self.lblUnopenPercentage.text =  reportItem?.unopenedPercentage == nil ? "0%" : "\((reportItem?.unopenedPercentage!)!)%"
        self.lblOpenPercentage.text =  reportItem?.openedPercentage == nil ? "0%" : "\((reportItem?.openedPercentage!)!)%"
        self.lblRatePercentage.text = reportItem?.ratePercentage == nil ? "0%" : "\((reportItem?.ratePercentage!)!)%"
        let values = [Double(reportItem?.openedPercentage == nil ? 0 : (reportItem?.openedPercentage!)!), Double(reportItem?.unopenedPercentage == nil ? 0 : (reportItem?.unopenedPercentage!)!), Double(reportItem?.bouncesPercentage == nil ? 0 : (reportItem?.bouncesPercentage!)!)]
        setPieChart(values: values)
    }
    
    func setPieChart(values: [Double])
    {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count
        {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChart.data = pieChartData
        pieChart.legend.enabled = false
        pieChart.drawEntryLabelsEnabled = false
        pieChart.chartDescription?.enabled = false
        pieChartDataSet.drawValuesEnabled = false
        pieChartDataSet.colors = [UIColor.green(), UIColor.primary(), UIColor.red()]
    }
}
