//
//  ResponseBase.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 10/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

enum RequestState {
    case success, loading, error
}

struct ServiceResponse {
    var request: RequestBase
    var status: RequestState = .loading
    var response: ResponseBase?
    var tryAgainAction: (() -> Void)?
}

protocol ResponseBase: Decodable, ResponsePart {
    
}

protocol ResponsePart {
    func getKeysAndValues() -> Dictionary<String, Any>?
}

extension ResponsePart {
    func getKeysAndValues() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = [:]
        
        for child in Mirror(reflecting: self).children {
            guard let childLabel = child.label else { continue }
            if let valueAsPart = child.value as? ResponsePart {
                dict[childLabel] = valueAsPart.getKeysAndValues()
            } else if let valueAsArrayPart = child.value as? [ResponsePart] {
                dict[childLabel] = valueAsArrayPart.map { $0.getKeysAndValues() }
            } else {
                dict[childLabel] = child.value
            }
        }
        
        if dict.keys.count == 0 {
            return nil
        }
        return dict
    }
}
