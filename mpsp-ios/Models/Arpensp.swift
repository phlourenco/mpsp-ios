//
//  Arpensp.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

enum ArpenspRegistryType: String, Codable {
    case BIRTH, MARRIAGE, DEATH, EMANCIPATION, INTERDITION, AWAY, STABLE_UNION
}

class ArpenspRequest: NSObject, RequestBase {
    
    var serviceName: String {
        return "ARPENSP"
    }
    
    var customMirror: Mirror {
        return Mirror(self, children: ["Tipo de registro": "", "Número do processo": "", "Vara": 0])
    }
    
    var registryType: ArpenspRegistryType
    var processNumber: String
    var place: Int
}

struct ArpenspResponse: Codable {
    var spouse1OldName: String
    var spouse1NewName: String
    var spouse2OldName: String
    var spouse2NewName: String
    var marriageDate: String
}
