//
//  RequestBase.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 02/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

protocol RequestBase: NSObject, Codable {
    func getServiceName() -> String
    func getEnumCases(propertyName: String) -> [String]?
    func getArrayValues(propertyName: String) -> [String]?
}

protocol StringEnum: Codable, CaseIterable {
    func getValue() -> String
}
