//
//  SelectableListViewController.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 07/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol SelectableListViewControllerDelegate: class {
    func didEndSelecting()
}

class SelectableListViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var titleItem: UINavigationItem! {
        didSet {
            titleItem.title = topTitle
        }
    }
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Private properties
    
    private var list: [String] = []
    
    // MARK: - Public properties
    
    weak var delegate: SelectableListViewControllerDelegate?
    var topTitle: String?
    var checkedList: [String] = []
    var didEndSelectingFunc: (([String]) -> Void)?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.removeAllSubviews()
        list.enumerated().forEach { offset, element in
            let btn = Checkbox()
            btn.tag = offset
            btn.setTitle(element, for: .normal)
            btn.contentHorizontalAlignment = .left
            btn.addTarget(self, action: #selector(handleChecks), for: .touchUpInside)
            stackView.addArrangedSubview(btn)
        }
    }
    
    // MARK: - Public methods
    
    func setTitle(_ title: String) {
        topTitle = title
    }
    
    func setList(_ list: [String], didEndSelectingFunc: (([String]) -> Void)?) {
        self.list = list
        self.didEndSelectingFunc = didEndSelectingFunc
    }
    
    // MARK: - Private methods
    
    @objc
    private func handleChecks(_ button: UIButton) {
        if button.isSelected {
            checkedList.append(list[button.tag])
        } else {
            checkedList.removeAll { $0 == list[button.tag] }
        }
    }
    
    @IBAction private func okAction(_ sender: Any) {
        dismiss(animated: true, completion: {
            self.didEndSelectingFunc?(self.checkedList)
        })
    }

}
