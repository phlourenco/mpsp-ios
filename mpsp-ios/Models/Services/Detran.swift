//
//  Detran.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class DetranRequest: NSObject, RequestBase {
    @objc var registry: String = ""
    @objc var rg: String = ""
    @objc var conductorName: String = ""
    @objc var pgu: String = ""
    @objc var uf: String = ""
    
    func getServiceName() -> String {
        return "DETRAN"
    }
}

struct DetranResponse: Codable {
    var pdfUrl: String
}
