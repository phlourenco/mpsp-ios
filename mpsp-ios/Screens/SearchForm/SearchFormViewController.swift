//
//  SearchFormViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 02/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol SearchFormView: BaseDisplayLogic {
    func generateForm(basedOnContracts contracts: [RequestBase])
}

class SearchFormViewController: UIViewController {

    @IBOutlet var fieldStackView: UIStackView!
    
    var viewModel: SearchFormViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.generateForm()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        viewModel?.makeRequests()
    }
    
    private func openSelectableList(title: String, list: [String], didEndSelectingFunc: (([String]) -> Void)?) {
        if let selectableListViewController = storyboard?.instantiateViewController(withIdentifier: "SelectableListViewController") as? SelectableListViewController {
            selectableListViewController.setTitle(title)
            selectableListViewController.setList(list, didEndSelectingFunc: didEndSelectingFunc)
            present(selectableListViewController, animated: true, completion: nil)
        }
    }
    
}

extension SearchFormViewController: SearchFormView {
    
    func generateForm(basedOnContracts contracts: [RequestBase]) {
        fieldStackView.removeAllSubviews()
        
        contracts.forEach { contract in
            let serviceNameLabel = UILabel()
            serviceNameLabel.text = contract.getServiceName()
            fieldStackView.addArrangedSubview(serviceNameLabel)
            
            Mirror(reflecting: contract).children.forEach { child in
                guard let propertyName = child.label else { return }
                
                var field: UITextField?
                
                if let enumCases = contract.getEnumCases(propertyName: propertyName) {
                    field = PickerBindableTextField(values: enumCases, onChange: { value in
                        contract.setValue(value, forKey: propertyName)
                    })
                } else if let arrayValues = contract.getArrayValues(propertyName: propertyName) {
                    field = BindableTextField(onBeginEditing: {
                        self.openSelectableList(title: propertyName, list: arrayValues, didEndSelectingFunc: { list in
                            field?.text = list.joined(separator: ", ")
                            contract.setValue(list, forKey: propertyName)
                        })
                    }, onChange: nil)
                } else {
                    field = BindableTextField(onChange: { value in
                        contract.setValue(value, forKey: propertyName)
                    })
                }
                if child.value is Int {
                    field?.keyboardType = .numberPad
                }
                field?.borderStyle = .roundedRect
                field?.placeholder = child.label
                if let field = field {
                    fieldStackView.addArrangedSubview(field)
                }
            }
        }
        
    }
    
}
