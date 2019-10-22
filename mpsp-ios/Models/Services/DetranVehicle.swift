//
//  DetranVehicle.swift
//  mpsp-ios-mock
//
//  Created by Paulo Lourenço on 21/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class DetranVehicleRequest: NSObject, RequestBase {
    @objc var board: String = ""
    @objc var document: String = ""
    @objc var renavam: String = ""
    
    func getServiceName() -> String {
        return "DETRAN (Veículo)"
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5dae4f543200006d00d95a53"
        #else
        #endif
    }
}

struct DetranVehicleResponse: ResponseBase {
    var registryFileUrl: String
}
