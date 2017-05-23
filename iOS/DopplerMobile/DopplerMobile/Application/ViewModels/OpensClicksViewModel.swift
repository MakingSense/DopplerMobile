//
//  OpensClicksViewModel.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 22/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit
import Charts

class OpensClicksViewModel: NSObject {
    
    let dailyReportGranularity:Double = 43200
    let defaultGranularity:Double = 1
    let dailyReportXAxisMinimum: Double = 0
    let defaultXAxisMinimum: Double = 1
    let dailyReportXAxisMaximum: Double = 86400
    let weeklyReportXAxisMaximum: Double = 7
    let monthlyReportXAxisMaximum: Double = 5
    let yearlyReportXAxisMaximum: Double = 12
    let interval = Observable<ReportInterval>(ReportInterval.Daily)
    let reportTypes = [ReportInterval.Daily, ReportInterval.Weekly, ReportInterval.Monthly, ReportInterval.Yearly]
    let graphicCustomReport: [CampaignPeriodicReportViewModel]
    let lastDaysReport: Observable2DArraySection<String, CampaignReportViewModel>
    let countryReports: Observable2DArraySection<String, CampaignReportViewModel>
    let dataSource: MutableObservable2DArray<String, CampaignReportViewModel>
    
    override init() {
        // TODO: Replace with real data
        graphicCustomReport = [CampaignPeriodicReportViewModel(date: DateUtils.parse(dateString: "2017-05-29T01:23:00Z"), opens: 10, clicks: 14), CampaignPeriodicReportViewModel(date: DateUtils.parse(dateString: "2017-05-29T03:11:00Z"), opens: 0, clicks: 3), CampaignPeriodicReportViewModel(date: DateUtils.parse(dateString: "2017-05-29T05:41:00Z"), opens: 4, clicks: 10), CampaignPeriodicReportViewModel(date: DateUtils.parse(dateString: "2017-05-29T11:15:00Z"), opens: 7, clicks: 12), CampaignPeriodicReportViewModel(date: DateUtils.parse(dateString: "2017-05-29T16:55:00Z"), opens: 2, clicks: 3)]
        lastDaysReport = Observable2DArraySection<String, CampaignReportViewModel>(
            metadata: "",
            items: [CampaignPeriodicReportViewModel(date: Date(), opens: 10, clicks: 14), CampaignPeriodicReportViewModel(date: Date(), opens: 4, clicks: 10), CampaignPeriodicReportViewModel(date: Date(), opens: 7, clicks: 12), CampaignPeriodicReportViewModel(date: Date(), opens: 2, clicks: 3)]
        )
        countryReports = Observable2DArraySection<String, CampaignReportViewModel>(
            metadata: "",
            items: [CampaignLocationReportViewModel(country: "Argentina", opens: 10), CampaignLocationReportViewModel(country: "Mexico", opens: 5), CampaignLocationReportViewModel(country: "Chile", opens: 13)]
        )
        dataSource = MutableObservable2DArray([lastDaysReport, countryReports])
    }
    
    func chartData() -> [LineChartDataSet] {
        var clicksDataEntries: [ChartDataEntry] = []
        var opensDataEntries: [ChartDataEntry] = []
        for campaignPeriodicReportViewModel in graphicCustomReport {
            if campaignPeriodicReportViewModel.clicks.value > 0 {
                clicksDataEntries.append(ChartDataEntry(x: getXValue(for: campaignPeriodicReportViewModel.date.value), y: Double(campaignPeriodicReportViewModel.clicks.value)))
            }
            if campaignPeriodicReportViewModel.opens.value > 0 {
                opensDataEntries.append(ChartDataEntry(x: getXValue(for: campaignPeriodicReportViewModel.date.value), y: Double(campaignPeriodicReportViewModel.opens.value)))
            }
        }

        let lineChartClicksDataSet = LineChartDataSet(values: clicksDataEntries, label: "")
        lineChartClicksDataSet.axisDependency = YAxis.AxisDependency.left
        
        let lineChartOpensDataSet = LineChartDataSet(values: opensDataEntries, label: "")
        lineChartOpensDataSet.axisDependency = YAxis.AxisDependency.left

        // Its a dataSet, but some UI properties have to be set on it... 🤔
        let clicksDataSetColor = UIColor(hexString: "9172FF")
        lineChartClicksDataSet.drawValuesEnabled = false
        lineChartClicksDataSet.lineWidth = 2
        lineChartClicksDataSet.circleColors = [clicksDataSetColor]
        lineChartClicksDataSet.circleRadius = 5
        lineChartClicksDataSet.circleHoleColor = clicksDataSetColor
        lineChartClicksDataSet.colors = [clicksDataSetColor]

        lineChartOpensDataSet.drawValuesEnabled = false
        lineChartOpensDataSet.lineWidth = 2
        lineChartOpensDataSet.circleColors = [UIColor.green()]
        lineChartOpensDataSet.circleRadius = 5
        lineChartOpensDataSet.circleHoleColor = UIColor.green()
        lineChartOpensDataSet.colors = [UIColor.green()]

        return [lineChartClicksDataSet, lineChartOpensDataSet]
    }
    
    private func getXValue(for date: Date) -> Double {
        var calendar = NSCalendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        switch interval.value.rawValue {
        case ReportInterval.Daily.rawValue:
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            return Double((hour * 60 + minutes) * 60)
        case ReportInterval.Weekly.rawValue:
            return Double(calendar.component(.weekday, from: date))
        case ReportInterval.Monthly.rawValue:
            return Double(calendar.component(.weekOfMonth, from: date))
        case ReportInterval.Yearly.rawValue:
            return Double(calendar.component(.month, from: date))
        default:
            fatalError()
        }
    }
    
    func getXAxisFormatter() -> IAxisValueFormatter {
        switch interval.value.rawValue {
        case ReportInterval.Daily.rawValue:
            return DailyAxisValueFormatter()
        case ReportInterval.Weekly.rawValue:
            return FixedAxisValueFormatter(["Monday".localized, "Tuesday".localized, "Wednesday".localized, "Thursday".localized, "Friday".localized, "Saturday".localized, "Sunday".localized])
        case ReportInterval.Monthly.rawValue:
            return FixedAxisValueFormatter(["Week 1".localized, "Week 2".localized, "Week 3".localized, "Week 4".localized, "Week 5".localized])
        case ReportInterval.Yearly.rawValue:
            return FixedAxisValueFormatter(["January".localized, "February".localized, "March".localized, "April".localized, "May".localized, "June".localized, "July".localized, "August".localized, "September".localized, "October".localized, "November".localized, "December".localized])
        default:
            fatalError()
        }
    }
    
    func getXAxisGranularity() -> Double {
        return interval.value == ReportInterval.Daily ? dailyReportGranularity : defaultGranularity
    }
    
    func getXAxisMinimum() -> Double {
        return interval.value == ReportInterval.Daily ? dailyReportXAxisMinimum : defaultXAxisMinimum
    }
    
    func getXAxisMaximum() -> Double {
        switch interval.value.rawValue {
        case ReportInterval.Daily.rawValue:
            return dailyReportXAxisMaximum
        case ReportInterval.Weekly.rawValue:
            return weeklyReportXAxisMaximum
        case ReportInterval.Monthly.rawValue:
            return monthlyReportXAxisMaximum
        case ReportInterval.Yearly.rawValue:
            return yearlyReportXAxisMaximum
        default:
            fatalError()
        }
    }
    
    func textForInterval(interval: ReportInterval) -> String {
        switch interval.rawValue {
        case ReportInterval.Daily.rawValue:
            return "LATEST 24HS".localized
        case ReportInterval.Weekly.rawValue:
            return "LAST WEEK".localized
        case ReportInterval.Monthly.rawValue:
            return "LAST MONTH".localized
        case ReportInterval.Yearly.rawValue:
            return "LAST YEAR"
        default:
            fatalError()
        }
    }
    
    func sendEmailReport() {
        // TODO: We need to impement this when the API is finished
    }
}
