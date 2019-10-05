//
//  Arpensp.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum ArpenspRegistryType: Int, Codable {
    case BIRTH, MARRIAGE, DEATH, EMANCIPATION, INTERDITION, AWAY, STABLE_UNION
}

class ArpenspRequest: NSObject, RequestBase {
    
    var serviceName: String {
        return "ARPENSP"
    }
    
    var customMirror: Mirror {
        return Mirror(self, children: ["Tipo de registro": "", "Número do processo": "", "Vara": 0])
    }
    
    @objc var registryType: ArpenspRegistryType = .MARRIAGE
    @objc var processNumber: String = ""
    @objc var place: Int = 0
}

struct ArpenspResponse: Codable {
    var spouse1OldName: String
    var spouse1NewName: String
    var spouse2OldName: String
    var spouse2NewName: String
    var marriageDate: String
}
