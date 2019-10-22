//
//  CategorySelectorViewModel.swift
//  mpsp-ios-mock
//
//  Created by Paulo Lourenço on 22/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

struct RequestGroup {
    var name: String
    var requests: [RequestBase]
}

class CategorySelectorViewModel {
    
    private let view: CategorySelectorView
    private let groups: [RequestGroup]
    private var selectedGroups: [RequestGroup] = []
    
    init(view: CategorySelectorView) {
        self.view = view
        groups = [
            RequestGroup(name: "Imobiliário", requests: [ArispRequest()]),
            RequestGroup(name: "Civil", requests: [ArpenspRequest(), DetranCNHRequest(), DetranTimeLineRequest(), DetranVehicleRequest()]),
            RequestGroup(name: "Jurídico", requests: [CadespRequest(), CensecRequest(), JucespRequest()]),
            RequestGroup(name: "Trabalhista", requests: [CagedWorkerRequest(), CagedCompanyRequest(), CagedResponsibleRequest()]),
            RequestGroup(name: "Criminal", requests: [InfocrimRequest(), SivecRequest()]),
            RequestGroup(name: "Eleitoral", requests: [SielRequest()])
        ]
    }
    
    func handleCategory(name: String, selected: Bool) {
        if selected {
            if let group = groups.first(where: { $0.name == name }) {
                selectedGroups.append(group)
            }
        } else {
            selectedGroups.removeAll(where: { $0.name == name })
        }
    }
    
    func getSelectedCategories() -> [RequestGroup] {
        return selectedGroups
    }
    
    func continueToSelectServices() {
        if selectedGroups.isEmpty {
            view.showError(title: "Erro", message: "Selecione pelo menos uma categoria para realizar a busca.", tryAgainAction: nil)
        } else {
            view.goToServiceSelector()
        }
    }
}
