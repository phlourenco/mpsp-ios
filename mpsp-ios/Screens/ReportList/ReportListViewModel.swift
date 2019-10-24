//
//  ReportListViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class ReportListViewModel {
    
    let view: ReportListView
    
    private var sections: [SectionBase] = []
    private var reports: [Report] = []
    
    init(view: ReportListView) {
        self.view = view
    }
    
    func getReports() {
        view.showScreenLoading()
        MPSPApi().requestReportList()
            .done(handleReports)
            .catch(handleError)
            .finally {
                self.view.hideScreenLoading()
            }
    }
    
    func getSections() -> [SectionBase] {
        return sections
    }
    
    func showReportDetails(of index: Int) {
        let responses = reports[index].getResponses()
        view.showDetails(responses: responses)
    }
    
    private func handleReports(_ reports: [Report]) {
        self.reports = reports
        sections = [ReportCellSection(reports: reports)]
        view.showList(empty: reports.isEmpty)
    }
    
    private func handleError(_ error: Error) {
        view.showError(title: "Erro", message: error.localizedDescription) {
            self.getReports()
        }
    }
    
}
