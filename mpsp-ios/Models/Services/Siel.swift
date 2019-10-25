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
    @objc var birthDate: String = ""
    @objc var documentNumber: String = "123456789012"
    @objc var processNumber: String = "12345"
    
    func getServiceName() -> String {
        return "SIEL"
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5da2729d2f00006c00f41952"
        #else
        return "/siel"
        #endif
    }
    
    func getKeyboardType(propertyName: String) -> SystemKeyboardType {
        if propertyName == "documentNumber" || propertyName == "processNumber" {
            return .number
        }
        return .default
    }
}

struct SielResponse: ResponseBase {
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
    
    func getServiceName() -> String {
        return "SIEL"
    }
}
