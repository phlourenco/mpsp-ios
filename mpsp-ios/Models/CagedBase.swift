//
//  CagedBase.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

enum CagedType: String, Codable {
    case RESPONSIBLE, COMPANY, WORKER
}

struct CagedRequestBase<T: Codable>: Codable {
    var type: CagedType
    var object: T
}
