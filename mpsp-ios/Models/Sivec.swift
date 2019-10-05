//
//  Sivec.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum SivecSearchType: Int, Codable {
    case SAP, RG, NAME
}

class SivecRequest: NSObject, RequestBase {
    var serviceName: String {
        return "SIVEC"
    }
    
    @objc var searchType: SivecSearchType = .NAME
    @objc var term: String = ""
}

struct SivecResponse: Codable {
    var name: String
    var sex: String
    var birth: String
    var rg: String
    var issueDateDocument: String
    var nickName: String
    var maritalStatus: String
    var naturalness: String
    var naturalized: Bool
    var study: String
    var fatherName: String
    var motherName: String
    var color: String
    var profession: String
    var hair: String
    var eyeColor: String
    var address: SivecAddress
}

struct SivecAddress: Codable {
    var street: String
    var city: String
}
