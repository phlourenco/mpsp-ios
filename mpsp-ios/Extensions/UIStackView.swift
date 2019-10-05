//
//  UIStackView.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 05/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func removeAllSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
}
