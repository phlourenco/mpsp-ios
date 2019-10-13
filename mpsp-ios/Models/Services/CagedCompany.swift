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
}

struct CagedCompanyResponse: Codable {
    var cnpj: String
    var name: String
    var cnae: String
    var subsidiaries: Int
    var admissions: Int
    var demissions: Int
}
