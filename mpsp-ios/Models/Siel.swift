//
//  Siel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class SielRequest: NSObject, RequestBase {
    
    var serviceName: String {
        return "SIEL"
    }
    
//    var customMirror: Mirror {
//        return Mirror(self, children: ["Nome": name, "Nome da mãe": motherName, "Data de nascimento": birthdate, "Título": numTitulo, "Processo": numProcess])
//    }
    
    @objc var name: String = ""
    @objc var motherName: String = ""
    @objc var birthdate: String = ""
    @objc var numTitulo: String = "" //CONFERIR!
    @objc var numProcess: String = ""
}

struct SielResponse: Codable {
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
