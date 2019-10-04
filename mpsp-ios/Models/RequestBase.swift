//
//  RequestBase.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 02/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

protocol RequestBase: NSObject, Codable {
    var serviceName: String { get }
}
