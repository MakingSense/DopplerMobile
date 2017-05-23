//
//  DeliveryRateViewController.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/5/17.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import Charts
import Bond

class DeliveryRateViewController: UIViewController, UITableViewDelegate {
    // MARK: Properties
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet fileprivate weak var lblOpenPercentage: UILabel!
    @IBOutlet fileprivate weak var lblUnopenPercentage: UILabel!
    @IBOutlet fileprivate weak var lblBouncesPercentage: UILabel!
    @IBOutlet fileprivate weak var lblRatePercentage: UILabel!
    @IBOutlet fileprivate weak var tblIndicators: UITableView!
    var reportItem: CampaignViewModel?
    var dataSource : GenericArrayDataSource<DeliveryRateReportTableViewCell, ListItem>?
    
    class func instantiateFromStoryboard(reportItem: CampaignViewModel) -> DeliveryRateViewController {
        let storyboard = UIStoryboard(name: StoryboardName.Reports, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! DeliveryRateViewController
        viewController.reportItem = reportItem
        return viewController
    }
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "REPORTS_TEXT".localized
        tblIndicators.delegate = self
        bindViewModel()
    }
    
    func bindViewModel() {
        reportItem?.bouncesPercentage.map{"\(String(describing: $0))%"}.bind(to: lblOpenPercentage)
        reportItem?.unopenedPercentage.map{"\(String(describing: $0))%"}.bind(to: lblUnopenPercentage)
        reportItem?.openedPercentage.map{"\(String(describing: $0))%"}.bind(to: lblOpenPercentage)
        reportItem?.ratePercentage.map{"\(String(describing: $0))%"}.bind(to: lblRatePercentage)
        
        reportItem?.deliveryRateIndicators.bind(to: tblIndicators) { deliveryRates, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryRateReportTableViewCell.identifier, for: indexPath) as! DeliveryRateReportTableViewCell
            cell.configure(viewModel: deliveryRates[indexPath.row])
            return cell
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureView()
    }
    
    func configureView() {
        let values = [Double(reportItem?.openedPercentage == nil ? 0 : (reportItem?.openedPercentage.value)!), Double(reportItem?.unopenedPercentage == nil ? 0 : (reportItem?.unopenedPercentage.value)!), Double(reportItem?.bouncesPercentage == nil ? 0 : (reportItem?.bouncesPercentage.value)!)]
        setPieChart(values: values)
    }
    
    func setPieChart(values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        pieChartView.legend.enabled = false
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.chartDescription?.enabled = false
        pieChartDataSet.drawValuesEnabled = false
        pieChartDataSet.colors = [UIColor.green(), UIColor.primary(), UIColor.red()]
    }
}
