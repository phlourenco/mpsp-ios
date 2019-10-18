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
    func showReport(_ list: [ServiceResponse])
}

class ResultListViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!

    var viewModel: ResultListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.makeRequests()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let reportVC = segue.destination as? ReportViewController, let responses = sender as? [ServiceResponse] {
            let vm = ReportViewModel(responses: responses)
            reportVC.viewModel = vm
        }
    }
    
    @IBAction func completeReportAct(_ sender: Any) {
        viewModel?.showCompleteReport()
    }
}

extension ResultListViewController: ResultListView {
    
    func showReport(_ list: [ServiceResponse]) {
        performSegue(withIdentifier: "reportSegue", sender: list)
    }
    
    func showList(_ list: [ServiceResponse]) {
        stackView.removeAllSubviews()
        for req in list {
            let view = LabelLoadingView(serviceResponse: req)
            view.delegate = self
            stackView.addArrangedSubview(view)
        }
    }
    
}

extension ResultListViewController: LabelLoadingViewDelegate {
    
    func getReport(response: ServiceResponse) {
        showReport([response])
    }
    
}
