//
//  Detran.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class DetranTimeLineRequest: NSObject, RequestBase {
    @objc var registry: String = ""
    @objc var rg: String = ""
    @objc var conductorName: String = ""
    @objc var pgu: String = ""
    @objc var uf: String = ""
    
    func getServiceName() -> String {
        return "DETRAN (Linha de Tempo)"
    }
    
    func getEndpoint() -> String {
        #if MOCK
        return "/5dae505d3200005d00d95a58"
        #else
        return "/detranTimeLine"
        #endif
    }
}

struct DetranTimeLineResponse: ResponseBase {
    var registryFileUrl: String
    
    func getServiceName() -> String {
        return "DETRAN (Linha de Tempo)"
    }
}
