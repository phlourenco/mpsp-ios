//
//  ArrayCellViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 17/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class ArrayCellViewModel: CellViewModel {
        
    var title: String
    var dictArray: [Dictionary<String, Any>]
    
    init(title: String, dictArray: [Dictionary<String, Any>]) {
        self.title = title
        self.dictArray = dictArray
    }
    
    
    
}
