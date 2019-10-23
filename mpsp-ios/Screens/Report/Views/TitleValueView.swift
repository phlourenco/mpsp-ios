//
//  TitleValueView.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 17/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

protocol TitleValueViewDelegate: class {
    func openUrl(_ url: URL)
}

class TitleValueView: UIView {

    // MARK: - IBOutlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var urlButton: UIButton!
    
    weak var delegate: TitleValueViewDelegate?
    
    // MARK: - Methods
    var url: URL?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(title: String, value: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 70))
        commonInit()
        
        titleLabel.text = title
        valueLabel.text = value
        urlButton.isHidden = true
    }
    
    init(title: String, url: URL) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 70))
        commonInit()
        
        self.url = url
        titleLabel.text = title
        valueLabel.isHidden = true
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TitleValueView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    @IBAction func urlAction(_ sender: Any) {
        if let url = url {
            delegate?.openUrl(url)
        }
    }
    
}
