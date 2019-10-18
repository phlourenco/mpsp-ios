//
//  StackedCell.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 17/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class StackedCell: ConfigurableCell {

    @IBOutlet weak var stackView: UIStackView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.removeAllSubviews()
    }
    
    override func configure(viewModel: CellViewModel, delegate: Any?) {
        if let viewModel = viewModel as? UniqueValueCellViewModel {
            handleUniqueValue(viewModel: viewModel)
        } else if let viewModel = viewModel as? MultiValueCellViewModel {
            handleObject(viewModel: viewModel)
        } else if let viewModel = viewModel as? ArrayCellViewModel {
            handleArray(viewModel: viewModel)
        }
    }
    
    private func handleUniqueValue(viewModel: UniqueValueCellViewModel) {
        let titleValueView = TitleValueView(title: viewModel.title, value: "\(viewModel.value)")
        stackView.addArrangedSubview(titleValueView)
    }
    
    private func handleObject(viewModel: MultiValueCellViewModel) {
        let objectNameLabel = UILabel()
        objectNameLabel.text = viewModel.title
        stackView.addArrangedSubview(objectNameLabel)
        for item in viewModel.dict {
            let titleValueView = TitleValueView(title: item.key, value: "\(item.value)")
            stackView.addArrangedSubview(titleValueView)
        }
    }
    
    private func handleArray(viewModel: ArrayCellViewModel) {
        let objectNameLabel = UILabel()
        objectNameLabel.text = viewModel.title
        stackView.addArrangedSubview(objectNameLabel)
        for (index, dict) in viewModel.dictArray.enumerated() {
            let itemLabel = UILabel()
            itemLabel.text = "Item \(index+1)"
            stackView.addArrangedSubview(itemLabel)
            for item in dict {
                let titleValueView = TitleValueView(title: item.key, value: "\(item.value)")
                stackView.addArrangedSubview(titleValueView)
            }
        }
    }
    
}
