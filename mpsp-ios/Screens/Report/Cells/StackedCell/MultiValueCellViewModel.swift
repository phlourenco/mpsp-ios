//
//  MultiValueCellViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 17/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class MultiValueCellViewModel: CellViewModel {
    
    var title: String
    var dict: Dictionary<String, Any>
    
    init(title: String, dictionary: Dictionary<String, Any>) {
        self.title = title
        dict = dictionary
    }
    
}
