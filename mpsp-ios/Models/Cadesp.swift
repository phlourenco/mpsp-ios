//
//  Cadesp.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 01/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

struct CadespRequest: Codable {
    var cnpj: String
}

struct CadespResponse: Codable {
    var ie: String
    var cnpj: String
    var businessName: String
    var drt: String
    var situation: Bool
    var dateStateRegistration: String
    var stateRegime: String
    var taxOffice: String
    var fantasyName: String?
    var nire: String
    var registrationSituation: Bool
    var taxOccurrence: Bool
    var unitType: String
    var ieStartDate: String
    var dateStartedSituation: String
    var practices: String
}
