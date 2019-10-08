//
//  Checkbox.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 07/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

enum IconCode: String {
    case checked = "\u{E834}"
    case unchecked = "\u{E835}"
}

class Checkbox: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        setupCheckBox(title: currentTitle)
        addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        setupCheckBox(title: title)
    }
    
    func setupCheckBox(title: String?) {
        setupState(.normal, title: title, textColor: .black, iconCode: .unchecked, iconColor: .black)
        setupState(.selected, title: title, textColor: .black, iconCode: .checked, iconColor: .blue)
        setupState([.normal, .disabled], title: title, textColor: .gray, iconCode: .unchecked, iconColor: .gray)
        setupState([.selected, .disabled], title: title, textColor: .gray, iconCode: .checked, iconColor: .gray)
    }
    
    private func setupState(_ state: UIControl.State, title: String?, textColor: UIColor, iconCode: IconCode, iconColor: UIColor) {
        let attText = NSMutableAttributedString(string: iconCode.rawValue, attributes: [NSAttributedString.Key.font: UIFont(name: "MaterialIcons-Regular", size: 20)!, NSAttributedString.Key.kern: 10, NSAttributedString.Key.foregroundColor: iconColor, NSAttributedString.Key.baselineOffset: -3])
        
        attText.append(NSMutableAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.baselineOffset: 1]))
        
        setAttributedTitle(attText, for: state)
    }
    
    @objc func clickAction(_ sender: UIButton) {
        isSelected = !isSelected
    }

}
