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
}
