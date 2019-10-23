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
    
    var delegate: Any?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.removeAllSubviews()
    }
    
    override func configure(viewModel: CellViewModel, delegate: Any?) {
        self.delegate = delegate
        if let viewModel = viewModel as? UniqueValueCellViewModel {
            handleUniqueValue(viewModel: viewModel)
        } else if let viewModel = viewModel as? MultiValueCellViewModel {
            handleObject(viewModel: viewModel)
        } else if let viewModel = viewModel as? ArrayCellViewModel {
            handleArray(viewModel: viewModel)
        }
    }
    
    private func handleUniqueValue(viewModel: UniqueValueCellViewModel) {
        let titleValueView = createTitleValueView(title: viewModel.title, value: "\(viewModel.value)")
        stackView.addArrangedSubview(titleValueView)
    }
    
    private func handleObject(viewModel: MultiValueCellViewModel) {
        let objectNameLabel = UILabel()
        objectNameLabel.text = viewModel.title
        stackView.addArrangedSubview(objectNameLabel)
        for item in viewModel.dict {
            let titleValueView = createTitleValueView(title: item.key, value: item.value)
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
                let titleValueView = createTitleValueView(title: item.key, value: item.value)
                stackView.addArrangedSubview(titleValueView)
            }
        }
    }
    
    private func createTitleValueView(title: String, value: Any) -> UIView {
        let translatedTitle = NSLocalizedString(title, comment: "")
        var view: TitleValueView?
        if (value as? String)?.isURL ?? false {
            view = TitleValueView(title: translatedTitle, url: URL(string: "\(value)")!)
        } else {
            view = TitleValueView(title: translatedTitle, value: "\(value)")
        }
        view?.delegate = (delegate as? TitleValueViewDelegate)
        return view ?? UIView()
    }
    
}
