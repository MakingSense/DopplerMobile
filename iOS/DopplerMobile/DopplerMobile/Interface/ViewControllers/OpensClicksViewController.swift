//
//  ReportEmptyViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import Charts
import Bond

class OpensClicksViewController: UIViewController {
    
    // MARK: Constants
    let periodicReportSectionHeaderHeight: CGFloat = 50
    let locationReportSectionHeaderHeight: CGFloat = 120
    let cellsHeight: CGFloat = 50

    // MARK: Properties
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var lblClicks: UILabel!
    @IBOutlet weak var lblOpens: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lblReportType: UILabel!
    @IBOutlet weak var btnReportType: UIButton!
    @IBOutlet weak var btnEmailReport: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: OpensClicksViewModel!
    
    class func instantiateFromStoryboard() -> OpensClicksViewController {
        let storyboard = UIStoryboard(name: StoryboardName.Reports, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! OpensClicksViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        // lblReportType bindings
        viewModel.interval.map { [weak self] in
                guard let strongSelf = self else {
                    return ""
                }
                return strongSelf.viewModel.textForInterval(interval: $0)
            }.bind(to: lblReportType)
        
        // btnReportType bindings
        btnReportType.reactive.tap.observeNext { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.tabBarController!.tabBar.isHidden = true
                strongSelf.pickerView.isHidden = false
            }.dispose(in: reactive.bag)

        // btnEmailReport bindings
        btnEmailReport.reactive.tap.observeNext { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.viewModel.sendEmailReport()
            }.dispose(in: reactive.bag)

        // tableView binding
        viewModel.dataSource.bind(to: tableView) { sectionDataSource, indexPath, tableView in
            let viewModel = sectionDataSource.item(at: indexPath)
            let cell = viewModel.getUITemplate(for: tableView, at: indexPath)
            cell.configure(viewModel: viewModel)
            return cell as! UITableViewCell
        }
        
        // lineChartView bindings
        viewModel.interval.observeNext { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.setLineChart()
            }.dispose(in: reactive.bag)
    }
}
