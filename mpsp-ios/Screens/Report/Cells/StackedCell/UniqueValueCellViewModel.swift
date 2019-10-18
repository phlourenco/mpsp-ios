//
//  UniqueValueCellViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 17/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class UniqueValueCellViewModel: CellViewModel {
        
    var title: String
    var value: Any
    
    init(title: String, value: Any) {
        self.title = title
        self.value = value
    }
    
}
