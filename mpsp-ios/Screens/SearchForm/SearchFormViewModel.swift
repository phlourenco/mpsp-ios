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
    
    private var selectedRequests: [RequestBase]
    
    init(view: SearchFormView, requests: [RequestBase]) {
        self.view = view
        self.selectedRequests = requests
    }
    
    func generateForm() {
        view.generateForm(basedOnContracts: selectedRequests)
    }
    
    func makeRequests() {
        selectedRequests.forEach { request in
            Mirror(reflecting: request).children.forEach { child in
                print("Label: \(child.label) - Value: \(child.value)")
            }
            print("------------------------")
        }
        
        
    }
    
}
