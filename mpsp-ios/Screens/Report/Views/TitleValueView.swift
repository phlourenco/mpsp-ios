//
//  TitleValueView.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 17/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class TitleValueView: UIView {

    // MARK: - IBOutlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
        
    // MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(title: String, value: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 70))
        commonInit()
        
        titleLabel.text = title
        valueLabel.text = value
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TitleValueView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }

}
