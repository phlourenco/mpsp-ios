//
//  DetranCNH.swift
//  mpsp-ios-mock
//
//  Created by Paulo Lourenço on 21/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class DetranCNHRequest: NSObject, RequestBase {
    @objc var cpf: String = ""
    
    func getServiceName() -> String {
        return "DETRAN (CNH)"
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5dae502e3200001200d95a57"
        #else
        #endif
    }
}

struct DetranCNHResponse: ResponseBase {
    var imageUrl: String
    var renach: String
    var category: String
    var emission: String
    var birthDate: String
    var conductionName: String
    var fatherName: String
    var motherName: String
    var registerDate: String
    var typographic: String
    var identification: String
    var cpf: String
}
