//
//  Censec.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

struct CensecRequest: Codable {
    var cpf: String
}

struct CensecResponse: Codable {
    var list: [CensecResponseItem]
}

struct CensecResponseItem: Codable {
    var office: String
    var date: String
    var act: String
    var actDate: String
    var book: String
    var page: String
    var parts: [CensecResponseItemPart]
}

struct CensecResponseItemPart: Codable {
    var name: String
    var document: String
    var role: String
}
