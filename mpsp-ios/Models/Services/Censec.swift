//
//  Censec.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class CensecRequest: NSObject, RequestBase {    
    @objc var cpfCnpj: String = ""
    
    func getServiceName() -> String {
        return "CENSEC"
    }
    
    func getKeyboardType(propertyName: String) -> SystemKeyboardType {
        if propertyName == "cpfCnpj" {
            return .number
        }
        return .default
    }
    
    func getMaxLength(propertyName: String) -> Int {
        if propertyName == "cpfCnpj" {
            return CommonConstants.kCnpjLength
        }
        return 0
    }
    
    func getAllowedLength(propertyName: String) -> Int? {
        if propertyName == "cpfCnpj" {
            return CommonConstants.kCpfLength
        }
        return nil
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5da79f5a1200004411eda945"
        #else
        return "/censec"
        #endif
    }
}

struct CensecResponse: ResponseBase {
//    var list: [CensecResponseItem]
    var office: String
    var date: String
    var act: String
    var actDate: String
    var book: String
    var page: String
    var parts: [CensecResponseItemPart]
    
    func getServiceName() -> String {
        return "CENSEC"
    }
}

//struct CensecResponseItem: Decodable, ResponsePart {
//    var office: String
//    var date: String
//    var act: String
//    var actDate: String
//    var book: String
//    var page: String
//    var parts: [CensecResponseItemPart]
//}

struct CensecResponseItemPart: Decodable, ResponsePart {
    var name: String
    var document: String
    var role: String
}
