//
//  ReportListViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol ReportListView: BaseDisplayLogic {
    func showList()
    func showDetails(responses: [ServiceResponse])
}

class ReportListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: ReportListViewModel?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ReportListViewModel(view: self)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        viewModel?.getReports()
    }
    
}

extension ReportListViewController: ReportListView {
    
    func showList() {
        tableView.reloadData()
    }
    
    func showDetails(responses: [ServiceResponse]) {
        performSegue(withIdentifier: "reportDetailsSegue", sender: responses)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let reportVC = segue.destination as? ReportViewController, let responses = sender as? [ServiceResponse] {
            let vm = ReportViewModel(responses: responses)
            reportVC.viewModel = vm
        }
    }
    
}

extension ReportListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.getSections().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getSections()[section].getNumberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }

        let section = viewModel.getSections()[indexPath.section]
        let identifier = section.getCellIdentifier(forRow: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ConfigurableCell else { return UITableViewCell() }
        
        cell.configure(viewModel: section.getViewModel(forRow: indexPath.row), delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.showReportDetails(of: indexPath.row)
    }
    
}
