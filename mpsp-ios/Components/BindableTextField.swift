//
//  BindableTextField.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 03/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class BindableTextField: UITextField, UITextFieldDelegate {
    
    private var editingChangeFunc: ((String?) -> Void)?
    private var editingBeginFunc: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(onBeginEditing: (() -> Void)? = nil, onChange changeFunc: ((String?) -> Void)?) {
        super.init(frame: .zero)
        editingChangeFunc = changeFunc
        editingBeginFunc = onBeginEditing
        addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        delegate = self
    }
    
    @objc
    private func editingBegin(_ field: UITextField) {
        editingBeginFunc?()
    }
    
    @objc
    private func editingChanged(_ field: UITextField) {
        editingChangeFunc?(field.text)
    }
    
//    override var canBecomeFirstResponder: Bool {
//        return (editingBeginFunc == nil)
//    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if editingBeginFunc != nil {
            editingBeginFunc?()
            return false
        }
        return true
    }
    
}
