//
//  ServiceSelectorViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 05/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class ServiceSelectorViewModel {
    
    private let view: ServiceSelectorView
    
    private var requests: [RequestBase] = []
    private var selectedRequests: [RequestBase] = []
    
    init(view: ServiceSelectorView) {
        self.view = view
        prepareRequests()
    }
    
    private func prepareRequests() {
        requests = [
            ArispRequest(),
            SielRequest(),
            ArpenspRequest(),
            DetranRequest(),
            JucespRequest(),
            CadespRequest(),
            CensecRequest(),
            SivecRequest(),
            CagedResponsibleRequest(),
            CagedCompanyRequest(),
            CagedWorkerRequest(),
            InfocrimRequest()
        ]
        view.showServiceList(requests.map { $0.getServiceName() }.sorted())
    }
    
    func getSelectedServicesRequests() -> [RequestBase] {
        return selectedRequests
    }
    
    func selectService(withName name: String, checked: Bool) {
        if checked {
            guard let foundServiceRequest = requests.first(where: { $0.getServiceName() == name }) else { return }
            selectedRequests.append(foundServiceRequest)
        } else {
            selectedRequests.removeAll(where: { $0.getServiceName() == name })
        }
    }
    
    
}
