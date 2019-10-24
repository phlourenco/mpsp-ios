//
//  MenuViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func infoAct(_ sender: Any) {
        let msg = "Grupo Morcegos\n\n Paulo Lourenço\n Thiago Cavalcante\n Gustavo Boehm\n Matheus Gonçalves\n Vitor Piovezam"
        
        let alertVC = UIAlertController(title: "Sobre o App", message: msg, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        
        present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func exitAct(_ sender: Any) {
        tabBarController?.dismiss(animated: true, completion: nil)
    }
    
}
