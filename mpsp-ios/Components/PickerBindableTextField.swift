//
//  PickerBindableTextField.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 05/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class PickerBindableTextField: BindableTextField {
    
    var values: [String] = []
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
        return pickerView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(values: [String], onChange changeFunc: ((String?) -> Void)?) {
        super.init(onChange: changeFunc)
        self.values = values
        inputView = pickerView
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    @objc
    private func editingDidEnd() {
        text = values[pickerView.selectedRow(inComponent: 0)]
    }
    
}

extension PickerBindableTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
}
