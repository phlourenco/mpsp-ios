//
//  ReportSection.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 17/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation
import UIKit

class ReportSection: SectionBase {
    
    let responseDictionary: Dictionary<String, Any>
    let serviceName: String
    
    private var keys: [String] = []
    private var values: [Any] = []


    var sectionTitle: String {
        return serviceName
    }
    
    init(serviceName: String, dictionary: Dictionary<String, Any>) {
        self.serviceName = serviceName
        responseDictionary = dictionary
        let keysAndValues = dictionary.toSortedKeysAndValues()
        keys = keysAndValues.0
        values = keysAndValues.1
    }

    func getNumberOfRows() -> Int {
        return responseDictionary.count
    }
    
    func getCellIdentifier(forRow row: Int) -> String {
        return "StackedCell"
    }

    func getViewModel(forRow row: Int) -> CellViewModel {
        let translatedTitle = NSLocalizedString(keys[row], comment: "")
        if values[row] is String || values[row] is Bool || values[row] is Int || values[row] is Double || values[row] is URL {
            return UniqueValueCellViewModel(title: translatedTitle, value: values[row])
        } else if let dictValues = values[row] as? Dictionary<String, Any> {
            return MultiValueCellViewModel(title: translatedTitle, dictionary: dictValues)
        } else if let arrayValues = values[row] as? Array<Dictionary<String, Any>> {
            return ArrayCellViewModel(title: translatedTitle, dictArray: arrayValues)
        } else {
            return REMOVECellViewModel()
        }
    }
}

class REMOVECellViewModel: CellViewModel {
    
    var height: CGFloat {
        return 10
    }
    
}
