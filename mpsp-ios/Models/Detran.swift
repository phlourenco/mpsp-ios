//
//  Detran.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

struct DetranRequest: Codable {
    var registry: String
    var rg: String
    var conductorName: String
    var pgu: String
    var uf: String
    var jhonson: [Int]
}

struct DetranResponse: Codable {
    var pdfUrl: String
}
