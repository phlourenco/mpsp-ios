//
//  ResultListViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 10/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class ResultListViewModel {
    
    private let view: ResultListView
    private let requests: [RequestBase]
    private var responses: [ServiceResponse] = [] {
        didSet {
            view.showList(responses)
        }
    }
    
    init(view: ResultListView, requests: [RequestBase]) {
        self.view = view
        self.requests = requests
        
        responses = requests.map { ServiceResponse(request: $0, status: .loading, response: nil) }
    }
    
    func getResponses() -> [ServiceResponse] {
        return responses
    }
    
    func makeRequests() {
        view.showList(responses)
        
        for (i, e) in requests.enumerated() {
            self.responses[i].tryAgainAction = {
                self.responses[i].status = .loading
                MPSPApi().requestService(endpoint: e.getEndpoint(), contract: e)
                    .done { data in
                        self.responses[i].status = .success
                        self.handleResponse(index: i, data: data)
                    }
                    .catch { error in
                        self.responses[i].status = .error
                    }
            }
            self.responses[i].tryAgainAction?()
        }
    }
    
    func showCompleteReport() {
        let successResponses = getResponses().filter { $0.status == .success }
        let showReportClosure = {
            self.view.showReport(successResponses)
        }
        if successResponses.count != responses.count {
            view.showConfirmation(title: "Relatório incompleto", message: "Ainda existem consultas em andamento. Deseja gerar o relatório mesmo assim?", actionTitle: "Continuar", cancelTitle: "Cancelar", action: showReportClosure)
        } else {
            showReportClosure()
        }
    }
    
    private func handleResponse(index: Int, data: Data) {
        if let arispResponse = data.parse(asObject: ArispResponse.self) {
            self.responses[index].response = arispResponse
        } else if let sielResponse = data.parse(asObject: SielResponse.self) {
            self.responses[index].response = sielResponse
        } else if let arpenspResponse = data.parse(asObject: ArpenspResponse.self) {
            self.responses[index].response = arpenspResponse
        } else if let detranResponse = data.parse(asObject: DetranResponse.self) {
            self.responses[index].response = detranResponse
        } else if let cagedResponsibleResponse = data.parse(asObject: CagedResponsibleResponse.self) {
            self.responses[index].response = cagedResponsibleResponse
        } else if let cagedCompanyResponse = data.parse(asObject: CagedCompanyResponse.self) {
            self.responses[index].response = cagedCompanyResponse
        } else if let cagedWorkerResponse = data.parse(asObject: CagedWorkerResponse.self) {
            self.responses[index].response = cagedWorkerResponse
        } else if let jucespResponse = data.parse(asObject: JucespResponse.self) {
            self.responses[index].response = jucespResponse
        } else if let cadespResponse = data.parse(asObject: CadespResponse.self) {
            self.responses[index].response = cadespResponse
        } else if let infocrimResponse = data.parse(asObject: InfocrimResponse.self) {
            self.responses[index].response = infocrimResponse
        } else if let censecResponse = data.parse(asObject: CensecResponse.self) {
           self.responses[index].response = censecResponse
        } else if let sivecResponse = data.parse(asObject: SivecResponse.self) {
           self.responses[index].response = sivecResponse
        }
        
        if self.responses[index].response == nil {
            self.responses[index].status = .error
        }
    }
    
    func kkn() {
        
    }
    
}
