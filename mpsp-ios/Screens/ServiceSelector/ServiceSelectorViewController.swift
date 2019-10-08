//
//  ServiceSelectorViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 02/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol ServiceSelectorView: BaseDisplayLogic {
    func showServiceList(_ list: [String])
}

class ServiceSelectorViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var servicesStackView: UIStackView!
    
    // MARK: - Properties
    
    var viewModel: ServiceSelectorViewModel?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ServiceSelectorViewModel(view: self)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        guard let requests = viewModel?.getSelectedServicesRequests(), !requests.isEmpty else {
            showError(title: "Erro", message: "Selecione pelo menos um serviço!", tryAgainAction: nil)
            return
        }
        performSegue(withIdentifier: "formSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let formVC = segue.destination as? SearchFormViewController {
            let searchFormViewModel = SearchFormViewModel(view: formVC, requests: viewModel?.getSelectedServicesRequests() ?? [])
            formVC.viewModel = searchFormViewModel
        }
    }
    
}

extension ServiceSelectorViewController: ServiceSelectorView {
    
    func showServiceList(_ list: [String]) {
        servicesStackView.removeAllSubviews()
        
        list.forEach { title in
            let switchText = SwitchText(title: title)
            switchText.delegate = self
            servicesStackView.addArrangedSubview(switchText)
        }
    }
    
}

extension ServiceSelectorViewController: SwitchTextDelegate {
    
    func switchTextChangedState(title: String, isOn: Bool) {
        viewModel?.selectService(withName: title, checked: isOn)
    }
    
}
