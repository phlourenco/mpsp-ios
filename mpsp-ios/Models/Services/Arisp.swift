//
//  Arisp.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

@objc enum ArispPersonType: Int, StringEnum {
    case person = 1, company
    
    func getValue() -> String {
        switch self {
        case .person:
            return "Pessoa física"
        case .company:
            return "Pessoa jurídica"
        }
    }
}

class ArispRequest: NSObject, RequestBase {
    @objc var personType: ArispPersonType = .person
    @objc var cityNames: [String] = []
    @objc var cpfCnpj: String = ""
    
    func getServiceName() -> String {
        return "ARISP"
    }
    
    func getEnumCases(propertyName: String) -> [EnumWrapper]? {
        if propertyName == "personType" {
            return ArispPersonType.allCases.map { EnumWrapper(intValue: $0.rawValue, stringValue: $0.getValue()) }
        }
        return nil
    }
    
    private func getArispCities() -> [String]? {
        if let path = Bundle.main.path(forResource: "arisp_cities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let cities = data.parse(asObject: [String].self)
                return cities
            } catch {
                return nil
            }
        }
        return nil
    }
    
    func getArrayValues(propertyName: String) -> [String]? {
        if propertyName == "cityNames" {
            return getArispCities()
        }
        return nil
    }
    
    func getKeyboardType(propertyName: String) -> SystemKeyboardType {
        if propertyName == "cpfCnpj" {
            return .number
        }
        return .default
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5da79de01200001100eda940"
        #else
        return "/arisp"
        #endif
    }
}

struct ArispResponse: ResponseBase {
    var registries: [ArispRegistry]
    
    func getServiceName() -> String {
        return "ARISP"
    }
}

struct ArispRegistry: Decodable, ResponsePart {
    var cityName: String
    var office: String
    var registryId: String
    var registryFileUrl: String
}
