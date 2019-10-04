//
//  CagedWorker.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

enum CagedWorkerSearchType: String, Codable {
    case PIS = "PIS/PASEP", CPF, NAME
}

struct CagedWorkerRequest: Codable {
    var searchType: CagedWorkerSearchType
    var term: String
}

struct CagedWorkerResponse: Codable {
    var name: String
    var pis: String
    var convertedPis: String
    var cpf: String
    var birthDate: String
    var ctpsSerie: String
    var pisSituation: String
    var sex: String
    var nationality: String
    var color: String
    var study: String
    var hasDisability: Bool
}
