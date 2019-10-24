//
//  ReportViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 16/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit
import SafariServices

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
    
    //workaround para corrigir bug do iOS 13
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        if let vc = self.presentedViewController as? UIActivityViewController {
            vc.dismiss(animated: flag, completion: completion)
            return
        }
        super.dismiss(animated: flag, completion: completion)
    }
    
    @IBAction func shareAct(_ sender: Any) {
        let img = screenshot()
        let imageToShare = [ img ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        let fakeVC = UIViewController()
        fakeVC.view.backgroundColor = .clear
        present(fakeVC, animated: false) {
            fakeVC.present(activityViewController, animated: false, completion: nil)
        }
    }
    
    func screenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(tableView.contentSize, false, UIScreen.main.scale)
        
        let frame = CGRect(x: 0, y: 0, width: tableView.contentSize.width, height: tableView.contentSize.height)

        let savedContentOffset = tableView.contentOffset
        let savedFrame = tableView.frame
        let savedBackgroundColor = tableView.backgroundColor

        tableView.contentOffset = .zero
        tableView.frame = frame
        tableView.backgroundColor = .clear

        let tempView = UIView(frame: frame)
        let tempSuperView = tableView.superview

        tableView.removeFromSuperview()

        tempView.addSubview(tableView)
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        tempView.layer.render(in: currentContext)

        guard let image =  UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        
        tempView.subviews[0].removeFromSuperview()
        tempSuperView?.addSubview(tableView)

        tableView.contentOffset = savedContentOffset
        tableView.frame = savedFrame
        tableView.backgroundColor = savedBackgroundColor
        
        UIGraphicsEndImageContext()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.removeConstraints(tableView.constraints)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        tempSuperView?.sendSubviewToBack(tableView)
        
        
        return image
    }

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

extension ReportViewController: TitleValueViewDelegate {
    func openUrl(_ url: URL) {
        let safVC = SFSafariViewController(url: url)
        present(safVC, animated: true, completion: nil)
    }
}
