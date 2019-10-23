//
//  ReportCellViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class ReportCellViewModel: CellViewModel {
    
    var title: String
    var subtitle: String?
    
    init(report: Report) {
        title = "Relatório #\(report.reportId)"
        
        if let profile = report.getProfile() {
            if let name = profile.name {
                subtitle = name
            } else if let cpfCnpj = profile.cpfCnpj {
                subtitle = cpfCnpj
            }
        }
    }
    
}
