//
//  SectionBase.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 16/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol CellViewModel { }

class ConfigurableCell: UITableViewCell {

    func configure(viewModel: CellViewModel, delegate: Any?) {
        fatalError("Can't call super! Must implement your own 'configure' method.")
    }
    
}

protocol SectionBase {
    var sectionTitle: String { get }
    func getNumberOfRows() -> Int
    func getCellIdentifier(forRow row: Int) -> String
    func getViewModel(forRow row: Int) -> CellViewModel
}
