//
//  ServiceSelectorViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 02/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class ServiceSelectorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let mirror = Mirror(reflecting: DetranRequest(registry: "123", rg: "456", conductorName: "Paulo", pgu: "abc", uf: "SP", jhonson: [1, 2]))
        
        mirror.children.forEach { child in
            print(child.label)
            print(child.value)
            print(type(of: child.value))
            print("---")
        }
    }
    

}
