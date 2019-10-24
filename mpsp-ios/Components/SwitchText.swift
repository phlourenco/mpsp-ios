//
//  SwitchText.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 05/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol SwitchTextDelegate: class {
    func switchTextChangedState(title: String, isOn: Bool)
}

@IBDesignable
class SwitchText: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var switchView: UISwitch!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    weak var delegate: SwitchTextDelegate?
    
    // MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(title: String, isOn: Bool = false) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        commonInit()
        
        titleLabel.text = title
        switchView.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        switchView.isOn = isOn
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SwitchText", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth]
        
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc
    private func valueChanged(_ switchView: UISwitch) {
        guard let title = titleLabel.text else { return }
        delegate?.switchTextChangedState(title: title, isOn: switchView.isOn)
    }
    
}
