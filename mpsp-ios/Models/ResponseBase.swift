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
    var responseData: Data?
    var tryAgainAction: (() -> Void)?
}

protocol ResponseBase: NSObject, Decodable {
    
}
