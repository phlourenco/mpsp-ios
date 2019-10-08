//
//  Siel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class SielRequest: NSObject, RequestBase {
    @objc var name: String = ""
    @objc var motherName: String = ""
    @objc var birthdate: String = ""
    @objc var numTitulo: String = "" //CONFERIR!
    @objc var numProcess: String = ""
    
    func getServiceName() -> String {
        return "SIEL"
    }

    func getEnumCases(propertyName: String) -> [String]? {
        return nil
    }
    
    func getArrayValues(propertyName: String) -> [String]? {
        return nil
    }
}

struct SielResponse: Codable {
    var name: String
    var title: String
    var birthday: String
    var zone: String
    var address: String
    var city: String
    var uf: String
    var domesticDate: String
    var fatherName: String
    var motherName: String
    var natural: String
    var validationCode: String
}
