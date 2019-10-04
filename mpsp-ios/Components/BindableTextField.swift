//
//  BindableTextField.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 03/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class BindableTextField: UITextField {
    
    private var editingChangeFunc: ((String?) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(onChange changeFunc: ((String?) -> Void)?) {
        super.init(frame: .zero)
        editingChangeFunc = changeFunc
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    @objc
    private func editingChanged(_ field: UITextField) {
        editingChangeFunc?(field.text)
    }
    
}
