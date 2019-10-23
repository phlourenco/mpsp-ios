//
//  ReportCellSection.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class ReportCellSection: SectionBase {
    
    var sectionTitle: String {
        return ""
    }
    
    let reports: [Report]
    
    init(reports: [Report]) {
        self.reports = reports
    }
    
    func getNumberOfRows() -> Int {
        return reports.count
    }
    
    func getCellIdentifier(forRow row: Int) -> String {
        return "ReportCell"
    }
    
    func getViewModel(forRow row: Int) -> CellViewModel {
        return ReportCellViewModel(report: reports[row])
    }
    
}
