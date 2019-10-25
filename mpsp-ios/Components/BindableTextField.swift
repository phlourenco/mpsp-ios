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
    var maxLength: Int = 0
    var allowedLength: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(onBeginEditing: ((UITextField) -> Void)? = nil, onChange changeFunc: ((String?) -> Void)?, canOpenKeyboard: Bool = true, maxLength: Int = 0, allowedLength: Int? = nil) {
        super.init(frame: .zero)
        self.maxLength = maxLength
        self.allowedLength = allowedLength
        self.canOpenKeyboard  = canOpenKeyboard
        editingChangeFunc = changeFunc
        editingBeginFunc = onBeginEditing
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        delegate = self
    }
    
    @objc
    private func editingChanged(_ field: UITextField) {
        editingChangeFunc?(field.text)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        editingBeginFunc?(self)
        return canOpenKeyboard
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard maxLength > 0 else { return true }
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= maxLength
    }
    
    func hasEnoughLength() -> Bool {
        guard let allowed = allowedLength else { return true }
        guard let realText = text, realText.count >= allowed else { return false }
        return true
    }
    
}
