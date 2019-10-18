//
//  ReportViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 16/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class ReportViewModel {
    
    var responses: [ServiceResponse]
    var sections: [ReportSection]
    
    init(responses: [ServiceResponse]) {
        self.responses = responses
        
        sections = responses.map { ReportSection(serviceName: $0.request.getServiceName(), dictionary: $0.response?.getKeysAndValues() ?? [:]) }
    }
    
    func getSections() -> [SectionBase] {
        return sections
    }
    
}
