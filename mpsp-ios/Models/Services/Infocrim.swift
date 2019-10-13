//
//  Infocrim.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class InfocrimRequest: NSObject, RequestBase {
    
    func getServiceName() -> String {
        return "INFOCRIM"
    }
    
    func getEndpoint() -> String {
        return "/5da2780d2f00007900f4195e"
    }
    
}

struct InfocrimResponse: Codable {
    var base64: String
}
