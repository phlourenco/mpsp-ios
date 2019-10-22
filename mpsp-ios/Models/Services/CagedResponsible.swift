//
//  Caged.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum CagedResponsibleSearchType: Int, StringEnum {
    case CNPJ = 1, CEI, CPF, NAME, CREA
    
    func getValue() -> String {
        switch self {
        case .CNPJ:
            return "CNPJ"
        case .CEI:
            return "CEI"
        case .CPF:
            return "CPF"
        case .NAME:
            return "NAME"
        case .CREA:
            return "CREA"
        }
    }
}

class CagedResponsibleRequest: NSObject, RequestBase {
    @objc var searchType: CagedResponsibleSearchType = .CPF
    @objc var term: String = ""
    
    func getServiceName() -> String {
        return "CAGED (Responsável)"
    }
    
    func getEnumCases(propertyName: String) -> [EnumWrapper]? {
        if propertyName == "searchType" {
            return CagedResponsibleSearchType.allCases.map { EnumWrapper(intValue: $0.rawValue, stringValue: $0.getValue()) }
        }
        return nil
    }
    
    func getKeyboardType(propertyName: String) -> SystemKeyboardType {
        if propertyName == "term", searchType == .NAME {
            return .default
        }
        return .number
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5da2746c2f00007900f41957"
        #else
        #endif
    }
}

struct CagedResponsibleResponse: ResponseBase {
    var identification: CagedResponsibleIdentification
    var address: CagedResponsibleAddress
    var contact: CagedResponsibleContact
}

struct CagedResponsibleIdentification: Decodable, ResponsePart {
    var cnpjCeiCpf: String
    var name: String
}

struct CagedResponsibleAddress: Decodable, ResponsePart {
    var street: String
    var neighborhood: String
    var city: String
    var state: String
    var cep: String
}

struct CagedResponsibleContact: Decodable, ResponsePart {
    var name: String
    var cpf: String
    var phone: String
    var line: String
    var email: String
}
