//
//  RequestBase.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 02/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation
import UIKit

enum SystemKeyboardType: Int {
    case number = 4, `default` = 0
}

struct EnumWrapper {
    var intValue: Int
    var stringValue: String
}

protocol RequestBase: NSObject, Codable {
    func getServiceName() -> String
    func getEnumCases(propertyName: String) -> [EnumWrapper]?
    func getArrayValues(propertyName: String) -> [String]?
    func getKeyboardType(propertyName: String) -> SystemKeyboardType
}

extension RequestBase {
    func getEnumCases(propertyName: String) -> [EnumWrapper]? {
        return nil
    }

    func getArrayValues(propertyName: String) -> [String]? {
        return nil
    }

    func getKeyboardType(propertyName: String) -> SystemKeyboardType {
        return .default
    }
}

protocol StringEnum: Codable, CaseIterable {
    func getValue() -> String
}
