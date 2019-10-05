//
//  SearchFormViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 02/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class SearchFormViewController: UIViewController {

    @IBOutlet var fieldStackView: UIStackView!
    
    let sielRequest = SielRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requests: [RequestBase] = [
//            ArispRequest(personType: .company, cityNames: nil, cpfCnpj: ""),
            sielRequest,
//            ArpenspRequest(registryType: .MARRIAGE, processNumber: "", place: 0)
        ]
        

        generateForm(basedOnContracts: requests)
    }
    
    private func generateForm(basedOnContracts contracts: [RequestBase]) {
        fieldStackView.removeAllSubviews()
        
        contracts.forEach { contract in
            let serviceNameLabel = UILabel()
            serviceNameLabel.text = contract.serviceName
            fieldStackView.addArrangedSubview(serviceNameLabel)
            
            Mirror(reflecting: sielRequest).children.forEach { child in
                guard let propertyName = child.label else { return }
                let field = BindableTextField(onChange: { value in
                    contract.setValue(value, forKey: propertyName)
                })
                field.borderStyle = .roundedRect
                field.placeholder = child.label
                fieldStackView.addArrangedSubview(field)
            }
        }
        
    }
    
    @IBAction func searchAction(_ sender: Any) {
        Mirror(reflecting: sielRequest).children.forEach { child in
            print("Label: \(child.label) - Value: \(child.value)")
        }
    }
    
}
