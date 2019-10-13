//
//  PickerBindableTextField.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 05/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class PickerBindableTextField: UITextField {
    
    private var editingChangeFunc: ((Int?) -> Void)?
    
    var values: [EnumWrapper] = []
    
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
    
    init(values: [EnumWrapper], onChange changeFunc: ((Int?) -> Void)?) {
        super.init(frame: .zero)
        self.editingChangeFunc = changeFunc
        self.values = values
        inputView = pickerView
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    @objc
    private func editingDidEnd() {
        text = values[pickerView.selectedRow(inComponent: 0)].stringValue
        editingChangeFunc?(values[pickerView.selectedRow(inComponent: 0)].intValue)
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
        return values[row].stringValue
    }
}
