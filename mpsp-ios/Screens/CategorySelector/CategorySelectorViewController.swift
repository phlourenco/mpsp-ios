//
//  CategorySelectorViewController.swift
//  mpsp-ios-mock
//
//  Created by Paulo Lourenço on 22/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol CategorySelectorView: BaseDisplayLogic {
    func goToServiceSelector()
}

class CategorySelectorViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: CategorySelectorViewModel?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CategorySelectorViewModel(view: self)
    }
    
    @IBAction func categorySelectAct(_ sender: UIButton) {
        print(sender.isSelected)
        viewModel?.handleCategory(name: sender.currentTitle ?? "", selected: sender.isSelected)
    }
    
    @IBAction func continueAct(_ sender: Any) {
        viewModel?.continueToSelectServices()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let servselVC = segue.destination as? ServiceSelectorViewController, let selectedCategories = viewModel?.getSelectedCategories() {
            let servselViewModel = ServiceSelectorViewModel(view: servselVC, requestCategories: selectedCategories)
            servselVC.viewModel = servselViewModel
        }
    }
    
}

extension CategorySelectorViewController: CategorySelectorView {
    
    func goToServiceSelector() {
        performSegue(withIdentifier: "serviceSelectorSegue", sender: nil)
    }
    
}
