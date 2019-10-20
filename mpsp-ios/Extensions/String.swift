//
//  String.swift
//  mpsp-ios-mock
//
//  Created by Paulo Lourenço on 19/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

extension String {
    
    var isURL: Bool {
        return starts(with: "http")
    }
    
}
