//
//  Dictionary.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 24/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    func toSortedKeysAndValues() -> ([String], [Any]) {
        let array: [(String, Any)] = self.map { (item) -> (String, Any) in
            return item
        }.sorted { (a, b) -> Bool in
            return NSLocalizedString(a.0, comment: "") < NSLocalizedString(b.0, comment: "")
        }
        let keys = array.map { $0.0 }
        let values = array.map { $0.1 }
        return (keys, values)
    }
}
