
//  CagedWorker.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum CagedWorkerSearchType: Int, StringEnum {
    case PIS, CPF, NAME
    
    func getValue() -> String {
        switch self {
        case .PIS:
            return "PIS/PASEP"
        case .CPF:
            return "CPF"
        case .NAME:
            return "Nome"
        }
    }
}

class CagedWorkerRequest: NSObject, RequestBase {
    @objc var searchType: CagedWorkerSearchType = .CPF
    @objc var term: String = ""
    
    func getServiceName() -> String {
        return "CAGED (Trabalhador)"
    }
    
    func getEnumCases(propertyName: String) -> [EnumWrapper]? {
        if propertyName == "searchType" {
            return CagedWorkerSearchType.allCases.map { EnumWrapper(intValue: $0.rawValue, stringValue: $0.getValue()) }
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
        return "/5da79fc31200004b00eda947"
    }
}

struct CagedWorkerResponse: ResponseBase {
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
