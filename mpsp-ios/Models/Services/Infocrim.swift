//
//  Infocrim.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation


@objc enum InfocrimInstitution: Int, StringEnum {
    case civilPolice = 1, militarPolice, prefecture
    
    func getValue() -> String {
        switch self {
        case .civilPolice:
            return "Polícia civil"
        case .militarPolice:
            return "Polícia militar"
        case .prefecture:
            return "Prefeitura"
        }
    }
}

class InfocrimRequest: NSObject, RequestBase {
    
    @objc var institution: InfocrimInstitution = .civilPolice
    
    func getServiceName() -> String {
        return "INFOCRIM"
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5dae4d283200005f00d95a48"
        #else
        return "/infocrim"
        #endif
    }
    
}

struct InfocrimResponse: ResponseBase {
    var url: String
    
    func getServiceName() -> String {
        return "INFOCRIM"
    }
}
