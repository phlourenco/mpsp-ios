//
//  CagedCompany.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

struct CagedCompanyRequest: Codable {
    var cnpj: String
}

struct CagedCompanyResponse: Codable {
    var cnpj: String
    var name: String
    var cnae: String
    var subsidiaries: Int
    var admissions: Int
    var demissions: Int
}
