//
//  ReportManager.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 12/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class ReportManager {
    static let shared = ReportManager()
    var reportId: String?
    
    func generateReportId() {
        reportId = UUID().uuidString
    }
}
