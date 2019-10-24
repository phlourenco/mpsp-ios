//
//  EmptyStateView.swift
//  mpsp-ios
//
//  Created by Paulo Henrique Lima Lourenco on 24/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 415, height: 345))
        commonInit()
        titleLabel.text = title
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("EmptyStateView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
//        heightAnchor.constraint(equalToConstant: 345).isActive = true
    }
    
}
