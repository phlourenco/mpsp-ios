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
    @objc var documentNumber: String = ""
    @objc var processNumber: String = ""
    
    func getServiceName() -> String {
        return "SIEL"
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5da2729d2f00006c00f41952"
        #else
        #endif
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
}
