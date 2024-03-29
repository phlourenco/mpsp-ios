//
//  CagedCompany.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class CagedCompanyRequest: NSObject, RequestBase {
    @objc var cnpj: String = ""
    
    func getServiceName() -> String {
        return "CAGED (Empresa)"
    }
    
    func getKeyboardType(propertyName: String) -> SystemKeyboardType {
        return .number
    }
    
    func getMaxLength(propertyName: String) -> Int {
        if propertyName == "cnpj" {
            return CommonConstants.kCnpjLength
        }
        return 0
    }
    
    func getAllowedLength(propertyName: String) -> Int? {
        if propertyName == "cnpj" {
            return CommonConstants.kCnpjLength
        }
        return nil
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5da79ee81200004411eda942"
        #else
        return "/cagedCompany"
        #endif
    }
}

struct CagedCompanyResponse: ResponseBase {
    var cnpj: String
    var name: String
    var cnae: String
    var subsidiaries: Int
    var admissions: Int
    var demissions: Int
    
    func getServiceName() -> String {
        return "CAGED (Empresa)"
    }
}
