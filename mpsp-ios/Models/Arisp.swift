//
//  Arisp.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum ArispPersonType: Int, Codable, CaseIterable {
    case person = 1, company
}

class ArispRequest: NSObject, RequestBase {
    
    var serviceName: String {
        return "ARISP"
    }
    
    var customMirror: Mirror {
        return Mirror(self, children: ["Tipo de pessoa": ArispPersonType.allCases, "Cidades": cityNames ?? [], "CPF/CNPJ": ""])
    }
    
    @objc var personType: ArispPersonType = .person
    @objc var cityNames: [String] = []
    @objc var cpfCnpj: String = ""
}

struct ArispResponse: Codable {
    var registries: [ArispRegistry]
}

struct ArispRegistry: Codable {
    var cityName: String
    var office: String
    var registryId: String
    var registryFileUrl: String
}
