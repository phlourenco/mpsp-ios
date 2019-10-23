//
//  Profile.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

struct Profile {
    var name: String?
    var cpfCnpj: String?
    
    init?(responses: [ResponsePart]) {
        for response in responses {
            if let dict = response.getKeysAndValues() {
                let keys = [String](dict.keys)
                let values = [Any](dict.values)
                
                if let firstNameIndex = keys.firstIndex(where: { $0 == "name" || $0 == "conductorName" || $0 == "conductionName" }) {
                    name = values[firstNameIndex] as? String
                }
                
                if let firstCpfIndex = keys.firstIndex(where: { $0 == "cpf" || $0 == "cpfCnpj" || $0 == "cnpjCeiCpf" }) {
                    cpfCnpj = values[firstCpfIndex] as? String
                }
            }
        }
        if name == nil, cpfCnpj == nil {
            return nil
        }
    }
}
