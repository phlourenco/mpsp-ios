//
//  Arpensp.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum ArpenspRegistryType: Int, Codable, StringEnum {
    case BIRTH, MARRIAGE, DEATH, EMANCIPATION, INTERDITION, AWAY, STABLE_UNION
    
    func getValue() -> String {
        switch self {
        case .BIRTH:
            return "BIRTH"
        case .MARRIAGE:
            return "MARRIAGE"
        case .DEATH:
            return "DEATH"
        case .EMANCIPATION:
            return "EMANCIPATION"
        case .INTERDITION:
            return "INTERDITION"
        case .AWAY:
            return "AWAY"
        case .STABLE_UNION:
            return "STABLE_UNION"
        }
    }
}

class ArpenspRequest: NSObject, RequestBase {
    @objc var registryType: ArpenspRegistryType = .MARRIAGE
    @objc var processNumber: String = ""
    @objc var place: Int = 0
    
    func getServiceName() -> String {
        return "ARPENSP"
    }
    
    func getEnumCases(propertyName: String) -> [EnumWrapper]? {
        if propertyName == "registryType" {
            return ArpenspRegistryType.allCases.map { EnumWrapper(intValue: $0.rawValue, stringValue: $0.getValue()) }
        }
        return nil
    }
    
    func getKeyboardType(propertyName: String) -> SystemKeyboardType {
        if propertyName == "place" || propertyName == "processNumber" {
            return .number
        }
        return .default
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5da273002f00007900f41954"
        #else
        return "/arpensp"
        #endif
    }
}

struct ArpenspResponse: ResponseBase {
    var spouse1OldName: String
    var spouse1NewName: String
    var spouse2OldName: String
    var spouse2NewName: String
    var marriageDate: String
}
