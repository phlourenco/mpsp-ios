//
//  Jucesp.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class JucespRequest: NSObject, RequestBase {
    var serviceName: String {
        return "JUCESP"
    }
    
    @objc var companyName: String = ""
}

struct JucespResponse: Codable {
    var companies: [JucespCompany]
}

struct JucespCompany: Codable {
    var companyType: String
    var date: String
    var initDate: String
    var cnpj: String
    var object: String
    var capital: String
    var address: String
    var number: String
    var locale: String
    var complement: String
    var postalCode: String
    var city: String
}
