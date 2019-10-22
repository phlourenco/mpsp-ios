//
//  SelectableButton.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 22/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class SelectableButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        
        tintColor = .white

        setImage(nil, for: .normal)
        if #available(iOS 13.0, *) {
            setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func clickAction(_ sender: UIButton) {
        isSelected = !isSelected
    }

}
