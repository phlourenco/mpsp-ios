//
//  Sivec.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum SivecSearchType: Int, Codable, StringEnum {
    case SAP, RG, NAME
    
    func getValue() -> String {
        switch self {
        case .NAME:
            return "Nome"
        case .RG:
            return "RG"
        case .SAP:
            return "SAP"
        }
    }
}

class SivecRequest: NSObject, RequestBase {
    @objc var searchType: SivecSearchType = .NAME
    @objc var term: String = ""
    
    func getServiceName() -> String {
        return "SIVEC"
    }
    
    func getEnumCases(propertyName: String) -> [EnumWrapper]? {
        if propertyName == "searchType" {
            return SivecSearchType.allCases.map { EnumWrapper(intValue: $0.rawValue, stringValue: $0.getValue()) }
        }
        return nil
    }
    
    func getEndpoint() -> String {
        return "/5da278c02f00003500f4195f"
    }
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
