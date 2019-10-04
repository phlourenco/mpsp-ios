//
//  Caged.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

enum CagedResponsibleSearchType: String, Codable {
    case CNPJ, CEI, CPF, NAME, CREA
}

struct CagedResponsibleRequest: Codable {
    var searchType: CagedResponsibleSearchType
    var term: String
}

struct CagedResponsibleResponse: Codable {
    var identification: CagedResponsibleIdentification
    var address: CagedResponsibleAddress
    var contact: CagedResponsibleContact
}

struct CagedResponsibleIdentification: Codable {
    var cnpjCeiCpf: String
    var name: String
}

struct CagedResponsibleAddress: Codable {
    var street: String
    var neighborhood: String
    var city: String
    var state: String
    var cep: String
}

struct CagedResponsibleContact: Codable {
    var name: String
    var cpf: String
    var phone: String
    var line: String
    var email: String
}
