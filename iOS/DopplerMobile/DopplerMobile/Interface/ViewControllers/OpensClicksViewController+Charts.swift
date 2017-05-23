//
//  OpensClicksViewController+Charts.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 31/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import UIKit
import Charts

extension OpensClicksViewController {

    func setLineChart() {
        let lineChartData = LineChartData(dataSets: viewModel.chartData())
        lineChartView.data = lineChartData
        lineChartView.legend.enabled = false
        lineChartView.chartDescription?.enabled = false
        lineChartView.rightAxis.enabled = false
        
        let xAxis = lineChartView.xAxis
        xAxis.granularity = viewModel.getXAxisGranularity()
        xAxis.axisMinimum = viewModel.getXAxisMinimum()
        xAxis.axisMaximum = viewModel.getXAxisMaximum()
        xAxis.drawGridLinesEnabled = false
        xAxis.valueFormatter = viewModel.getXAxisFormatter()
        xAxis.labelPosition = XAxis.LabelPosition.bottom
        xAxis.labelFont = UIFont.lightOf(size: 11)
        xAxis.labelTextColor = UIColor.lightGray
        
        let leftAxis = lineChartView.leftAxis
        leftAxis.labelFont = UIFont.lightOf(size: 13)
        leftAxis.labelTextColor = UIColor.lightGray
    }
}
