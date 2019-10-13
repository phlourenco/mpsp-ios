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
    private var editingBeginFunc: ((UITextField) -> Void)?
    private var canOpenKeyboard: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(onBeginEditing: ((UITextField) -> Void)? = nil, onChange changeFunc: ((String?) -> Void)?, canOpenKeyboard: Bool = true) {
        super.init(frame: .zero)
        self.canOpenKeyboard  = canOpenKeyboard
        editingChangeFunc = changeFunc
        editingBeginFunc = onBeginEditing
//        addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        delegate = self
    }
    
//    @objc
//    private func editingBegin(_ field: UITextField) {
//        editingBeginFunc?(self)
//    }
    
    @objc
    private func editingChanged(_ field: UITextField) {
        editingChangeFunc?(field.text)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        editingBeginFunc?(self)
        return canOpenKeyboard
//        if editingBeginFunc != nil {
//            editingBeginFunc?()
//            return false
//        }
//        return true
    }
    
}
