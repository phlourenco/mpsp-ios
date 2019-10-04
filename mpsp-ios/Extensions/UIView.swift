//
//  UIView.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 30/09/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}
