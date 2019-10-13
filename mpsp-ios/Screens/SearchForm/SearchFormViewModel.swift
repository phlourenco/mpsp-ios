//
//  SearchFormViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 05/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class SearchFormViewModel {
    
    private let view: SearchFormView
    
    var selectedRequests: [RequestBase]
    
    init(view: SearchFormView, requests: [RequestBase]) {
        self.view = view
        self.selectedRequests = requests.sorted(by: { (a, b) -> Bool in
            return a.getServiceName() < b.getServiceName()
        })
    }
    
    func generateForm() {
        view.generateForm(basedOnContracts: selectedRequests)
    }
    
}
