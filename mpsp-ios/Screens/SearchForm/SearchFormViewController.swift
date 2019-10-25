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
    func presentResults()
}

class SearchFormViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet var fieldStackView: UIStackView!
    
    // MARK: - Public properties

    var viewModel: SearchFormViewModel?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.generateForm()
    }
    
    @IBAction func searchAction(_ sender: Any) {
//        let textFields = fieldStackView.arrangedSubviews.compactMap { $0 as? UITextField }
//        textFields.forEach { field in
//            if let bindableTextField = field as? BindableTextField, let propertyName = bindableTextField.placeholder {
//                if !bindableTextField.hasEnoughLength() {
//                    bindableTextField.layer.borderColor = UIColor.red.cgColor
//                    bindableTextField.layer.borderWidth = 2
//                    showError(title: "Erro", message: "Preencha o campo '\(propertyName)' corretamente", tryAgainAction: nil)
//                    return
//                } else {
//                    bindableTextField.layer.borderColor = UIColor.clear.cgColor
//                    bindableTextField.layer.borderWidth = 0
//                }
//            }
//        }
//        
//        let fieldsContents = textFields.map { $0.text }
//        viewModel?.validateForms(fieldsContents)
        
        presentResults()
    }
    
    private func openSelectableList(title: String, list: [String], didEndSelectingFunc: (([String]) -> Void)?) {
        if let selectableListViewController = storyboard?.instantiateViewController(withIdentifier: "SelectableListViewController") as? SelectableListViewController {
            selectableListViewController.setTitle(title)
            selectableListViewController.setList(list, didEndSelectingFunc: didEndSelectingFunc)
            present(selectableListViewController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultListViewController {
            let vm = ResultListViewModel(view: resultVC, requests: viewModel?.selectedRequests ?? [])
            resultVC.viewModel = vm
        }
    }
    
}

extension SearchFormViewController: SearchFormView {
    
    func generateForm(basedOnContracts contracts: [RequestBase]) {
        fieldStackView.removeAllSubviews()
        
        contracts.forEach { contract in
            let serviceNameLabel = UILabel()
            serviceNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            serviceNameLabel.text = contract.getServiceName()
            fieldStackView.addArrangedSubview(serviceNameLabel)
            
            Mirror(reflecting: contract).children.forEach { child in
                guard let propertyName = child.label else { return }
                let translatedTitle = NSLocalizedString(propertyName, comment: "")
                
                var field: UITextField?
                
                if let enumCases = contract.getEnumCases(propertyName: propertyName) {
                    field = PickerBindableTextField(values: enumCases, onChange: { value in
                        contract.setValue(value, forKey: propertyName)
                    })
                } else if let arrayValues = contract.getArrayValues(propertyName: propertyName) {
                    field = BindableTextField(onBeginEditing: { _ in
                        self.openSelectableList(title: translatedTitle, list: arrayValues, didEndSelectingFunc: { list in
                            field?.text = list.joined(separator: ", ")
                            contract.setValue(list, forKey: propertyName)
                        })
                    }, onChange: nil, canOpenKeyboard: false)
                } else {
                    field = BindableTextField(onBeginEditing: { textField in
                        self.handleKeyboard(field: textField, contract: contract, child: child)
                    }, onChange: { value in
                        contract.setValue(value, forKey: propertyName)
                    }, maxLength: contract.getMaxLength(propertyName: propertyName), allowedLength: contract.getAllowedLength(propertyName: propertyName))
                }
                handleKeyboard(field: field, contract: contract, child: child)
                field?.borderStyle = .roundedRect
                field?.placeholder = NSLocalizedString(translatedTitle, comment: "")
                if let field = field {
                    fieldStackView.addArrangedSubview(field)
                }
            }
        }
    }
    
    private func handleKeyboard(field: UITextField?, contract: RequestBase, child: Mirror.Child) {
        guard let propertyName = child.label else { return }
        if child.value is Int || contract.getKeyboardType(propertyName: propertyName) == .number {
            field?.keyboardType = .numberPad
        } else {
            field?.keyboardType = .default
        }
    }
    
    func presentResults() {
        performSegue(withIdentifier: "resultSegue", sender: viewModel?.selectedRequests)
    }
    
}
