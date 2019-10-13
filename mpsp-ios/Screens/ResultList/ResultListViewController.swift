//
//  ResultListViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 10/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit



protocol ResultListView: BaseDisplayLogic {
    func showList(_ list: [ServiceResponse])
}

class ResultListViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!

    var viewModel: ResultListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.makeRequests()
    }
}


extension ResultListViewController: ResultListView {
    
    func showList(_ list: [ServiceResponse]) {
        stackView.removeAllSubviews()
        for req in list {
            let view = LabelLoadingView(serviceResponse: req)
            stackView.addArrangedSubview(view)
        }
    }
    
}
