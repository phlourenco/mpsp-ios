//
//  ReportViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 16/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class ReportViewModel {
    
    var responses: [ResponseBase]
    var sections: [ReportSection]
    
    init(responses: [ResponseBase]) {
        self.responses = responses
        
        sections = responses.map { ReportSection(serviceName: $0.getServiceName(), dictionary: $0.getKeysAndValues() ?? [:]) }.sorted(by: { (a, b) -> Bool in
            return a.serviceName < b.serviceName
        })
    }
    
    func getSections() -> [SectionBase] {
        return sections
    }
    
}
