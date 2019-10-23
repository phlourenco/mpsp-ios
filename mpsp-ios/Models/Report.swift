//
//  Report.swift
//  mpsp-ios
//
//  Created by Paulo Henrique Lima Lourenco on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

struct Report: Decodable {
    var reportId: String
    var arisp: ArispResponse?
    var arpensp: ArpenspResponse?
    var cadesp: CadespResponse?
    var cagedResponsible: CagedResponsibleResponse?
    var cagedWorker: CagedWorkerResponse?
    var cagedCompany: CagedCompanyResponse?
    var censec: CensecResponse?
    var detranCNH: DetranCNHResponse?
    var detranTimeLine: DetranTimeLineResponse?
    var detranVehicle: DetranVehicleResponse?
    var infocrim: InfocrimResponse?
    var siel: SielResponse?
    var sivec: SivecResponse?
    
    
    func getProfile() -> Profile? {
        return Profile(responses: getResponses())
    }
    
    func getResponses() -> [ResponseBase] {
        var responses = [ResponseBase]()
        appendIfNotNull(value: arisp, array: &responses)
        appendIfNotNull(value: arpensp, array: &responses)
        appendIfNotNull(value: cadesp, array: &responses)
        appendIfNotNull(value: cagedCompany, array: &responses)
        appendIfNotNull(value: cagedResponsible, array: &responses)
        appendIfNotNull(value: cagedWorker, array: &responses)
        appendIfNotNull(value: censec, array: &responses)
        appendIfNotNull(value: detranCNH, array: &responses)
        appendIfNotNull(value: detranTimeLine, array: &responses)
        appendIfNotNull(value: detranVehicle, array: &responses)
        appendIfNotNull(value: infocrim, array: &responses)
        appendIfNotNull(value: siel, array: &responses)
        appendIfNotNull(value: sivec, array: &responses)
        return responses
    }
    
    
    private func appendIfNotNull(value: ResponseBase?, array: inout [ResponseBase]) {
        if let value = value {
            array.append(value)
        }
    }
}
