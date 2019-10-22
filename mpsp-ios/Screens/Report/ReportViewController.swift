//
//  ReportViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 16/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit


public extension UIScrollView {
    public var snapshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(contentSize, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        let previousFrame = frame
        frame = CGRect(origin: frame.origin, size: contentSize)
        layer.render(in: context)
        frame = previousFrame
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}


protocol ReportView: BaseDisplayLogic {
    
}

class ReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ReportViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StackedCell", bundle: nil), forCellReuseIdentifier: "StackedCell")
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
    
    @IBAction func shareAct(_ sender: Any) {
        // image to share
//        var image: UIImage?
//        if #available(iOS 13.0, *) {
//            image = UIImage(systemName: "pencil")
//        } else {
//            image = nil
//        }
//        
        guard let img = tableView.snapshot else { return }

        // set up activity view controller
        let imageToShare = [ img ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
//        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)

    }
}

extension ReportViewController: ReportView {

    
}

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.getSections().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.getSections()[section].sectionTitle
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
    
}
